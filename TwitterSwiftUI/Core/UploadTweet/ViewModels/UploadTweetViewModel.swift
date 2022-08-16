//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-16.
//

import Foundation

class UploadTweetViewModel : ObservableObject{
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption)
    }
}
