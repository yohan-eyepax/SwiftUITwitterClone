//
//  UserStatsView.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-15.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack (spacing: 24){
            HStack(spacing: 4){
                Text("2")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .foregroundColor(.gray)
            }
            
            HStack (spacing: 4){
                Text("4")
                    .font(.subheadline)
                    .bold()
                Text("Followers")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
