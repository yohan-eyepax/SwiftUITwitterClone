//
//  MainTabView.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-15.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    var body: some View {
        // Tab View
        TabView(selection: $selectedIndex){
            
            // Feed view
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem{
                    Image(systemName: "house")
                }
                .tag(0)
            
            // Explore View
            ExploreView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            // Notifications View
            NotificationsView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem{
                    Image(systemName: "bell.fill")
                }
                .tag(2)
            
            // Messages view
            MessagesView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem{
                    Image(systemName: "envelope")
                }
                .tag(3)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
