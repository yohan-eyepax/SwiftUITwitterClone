//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-15.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullName = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            
            ScrollView{
                
                NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $viewModel.didAuthenticateUser, label: {})
                
                //Header View
                AuthHeaderView(title1: "Get Started.", title2: "Create your account")
                
                VStack(spacing: 40){
                    CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                    CustomInputField(imageName: "person", placeholderText: "Username", text:$username)
                    CustomInputField(imageName: "person", placeholderText: "Full Name", text: $fullName)
                    CustomInputField(imageName: "lock", placeholderText: "Password", isSecuredField: true, text: $password)
                }
                .padding(32)
                
                Button{
                    viewModel.register(
                        withEmail: email,
                        password: password,
                        fullName: fullName,
                        username: username
                    )
                }label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                        
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                Spacer()
                
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    HStack{
                        Text("Don't have an account?")
                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.bottom, 32)
            }
        }
        .ignoresSafeArea()
        .overlay {
            if viewModel.isLoading{
                ActivityIndicator()
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
