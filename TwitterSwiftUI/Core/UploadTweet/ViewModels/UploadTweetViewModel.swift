//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-16.
//

import Foundation

class UploadTweetViewModel : ObservableObject{
    @Published var didUploadTweet = false
    let service = TweetService()
    
    
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption) { success in
            if success {
                // dismiss screen
                self.didUploadTweet = true
            }else{
                // show error message to user
            }
        }
    }
}
