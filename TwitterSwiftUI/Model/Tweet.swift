//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-16.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable{
    @DocumentID var id: String?
    let caption: String
    var likes: Int
    let timestamp: Timestamp
    let uid: String
    
    var user: User?
    var didLike: Bool? = false
}
