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
        checkIfuserLikedTweet()
    }
    
    func likeTweet(){
        print("DEBUG: like tweet")
        service.likeTweet(tweet) {
            self.tweet.didLike = true
            self.tweet.likes += 1
        }
    }
    
    func unlikeTweet(){
        print("DEBUG: Unlike tweet")
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
            self.tweet.likes -= 1
        }
    }
    
    func checkIfuserLikedTweet(){
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike{
                self.tweet.didLike = true
            }
        }
    }
}
