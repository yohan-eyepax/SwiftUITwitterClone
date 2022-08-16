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
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error{
                print("DEBUG: Failed to signin with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, fullName: String, username: String){
        print("DEBUG: Register with email \(email)")
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error{
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
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
        guard let uid = tempUserSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else {return}
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
