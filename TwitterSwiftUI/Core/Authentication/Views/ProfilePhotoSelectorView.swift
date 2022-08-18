//
//  PhotoSelectorView.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-16.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack(spacing: 44){
            AuthHeaderView(title1: "Setup account", title2: "Add a profile photo")
            
            Button{
                showImagePicker.toggle()
            }label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                        .clipShape(Circle())
                }else{
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .modifier(ProfileImageModifier())
                }
                
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                Button{
                    viewModel.uploadProfileImage(selectedImage)
                }label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                        
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
        .overlay {
            if viewModel.isLoading{
                ActivityIndicator()
            }
        }
    }
    
    func loadImage() {
        print("DEBUG: ON LOAD IMAGE")
        guard let selectedImage = selectedImage else {return}
        print("DEBUG: ON LOAD IMAGE AFTER")
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 180, height: 180)
            //.padding(.top, 44)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
