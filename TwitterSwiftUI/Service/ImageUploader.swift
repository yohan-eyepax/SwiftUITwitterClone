//
//  ImageUploader.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-16.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader{
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error{
                print("DEBUG: \(error)")
                print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
                return
            }
            
            ref .downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else {return}
                completion(imageUrl)
            }
        }
    }
}

