//
//  TweetsRowView.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-15.
//

import SwiftUI

struct TweetsRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            // Profile image + user info + tweet
            HStack (alignment: .top, spacing: 12){
                // Profile image
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                // User info and tweet caption
                VStack(alignment: .leading, spacing: 4){
                    
                    // User info
                    HStack{
                        
                        Text("Bruce wayne")
                            .font(.subheadline)
                            .bold()
                        
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // tweet caption
                    
                    Text("I believe in Harvy Dent")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            // Action Buttons
            HStack{
                
                Button{
                    // action goes here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    // action goes here
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    // action goes here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    // action goes here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
        
    }
}

struct TweetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetsRowView()
    }
}
