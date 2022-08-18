//
//  TweetsRowView.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-15.
//

import SwiftUI
import Kingfisher

struct TweetsRowView: View {
    @ObservedObject var viewModel : TweetRowViewModel
    
    init(tweet: Tweet){
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    var body: some View {
        VStack(alignment: .leading){
            // Profile image + user info + tweet
            if let user = viewModel.tweet.user{
                HStack (alignment: .top, spacing: 12){
                    // Profile image
                    
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                    
                    
                    // User info and tweet caption
                    VStack(alignment: .leading, spacing: 4){
                        
                        // User info
                            HStack{
                                
                                Text(user.fullname)
                                    .font(.subheadline)
                                    .bold()
                                
                                Text("@\(user.username)")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                
                                Text("2w")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                            }
                        
                        // tweet caption
                        
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
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
                    viewModel.tweet.didLike ?? false ? viewModel.unlikeTweet() : viewModel.likeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill": "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red: .gray)
                    
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

//struct TweetsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetsRowView()
//    }
//}
