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
    @Published var isLoading : Bool = false
    
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
        isLoading = true
        service.fetchUsers { users in
            self.users = users
            self.isLoading = false
            //print("DEBUG: users \(users)")
        }
    }
}
