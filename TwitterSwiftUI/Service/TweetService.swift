//
//  TweetService.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-16.
//

import Firebase

struct TweetService{
    func uploadTweet(caption: String){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid": uid,
                                   "caption": caption,
                                   "likes": 0,
                                   "timestamp": Timestamp(date: Date())
        ] as [String: Any]
        
        Firestore.firestore().collection("tweets").document()
            .setData(data) { _ in
                print("DEBUG: Did upload tweet")
            }
    }
}
