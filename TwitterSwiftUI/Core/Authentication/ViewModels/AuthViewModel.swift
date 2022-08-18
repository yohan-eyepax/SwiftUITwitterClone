//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-16.
//

import SwiftUI
import Firebase

class AuthViewModel : ObservableObject{
    @Published var userSession: Firebase.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    @Published var isLoading = false
    @Published var error: String?
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        self.isLoading = true
        
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error{
                print("DEBUG: Failed to signin with error \(error.localizedDescription)")
                self.error = error.localizedDescription
                self.isLoading = false
                return
            }
            
            guard let user = result?.user else {
                self.isLoading = false
                return
                
            }
            self.userSession = user
            self.fetchUser()
            self.isLoading = false
        }
    }
    
    func register(withEmail email: String, password: String, fullName: String, username: String){
        self.isLoading = true
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error{
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                self.isLoading = false
                return
            }
            
            guard let user = result?.user else {
                self.isLoading = false
                return}
            self.tempUserSession = user
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullName,
                        "uid": user.uid
            ]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                    self.isLoading = false
                }
            
        }
    }
    
    func signOut(){
        // sets user session to nil so we show login view
        userSession = nil
        // signs user out on server
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage){
        self.isLoading = true
        guard let uid = tempUserSession?.uid else {
            self.isLoading = false
            return}
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                    self.isLoading = false
                }
        }
    }
    
    func fetchUser(){
        self.isLoading = true
        guard let uid = self.userSession?.uid else {
            self.isLoading = false
            return}
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
            self.isLoading = false
        }
    }
}
