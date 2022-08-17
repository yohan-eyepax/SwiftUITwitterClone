//
//  ExploreViewModel.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-16.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchableUsers : [User]{
        if searchText.isEmpty{
            return users
        }else{
            let lowerCasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowerCasedQuery) ||
                $0.fullname.lowercased().contains(lowerCasedQuery)
            })
        }
    }
    let service = UserService()
    
    init(){
        fetchUser()
    }
    
    func fetchUser(){
        service.fetchUsers { users in
            self.users = users
            //print("DEBUG: users \(users)")
        }
    }
}
