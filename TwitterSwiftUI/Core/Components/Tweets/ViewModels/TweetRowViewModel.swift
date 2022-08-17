//
//  TweetRowViewModel.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-17.
//

import Foundation

class TweetRowViewModel: ObservableObject{
    @Published var tweet: Tweet
    private let service = TweetService()
    
    
    init(tweet: Tweet){
        self.tweet = tweet
    }
    
    func likeTweet(){
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
}
