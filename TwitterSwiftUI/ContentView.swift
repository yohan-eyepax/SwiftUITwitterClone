//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Yohan Dushmantha on 2022-08-15.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    var body: some View {
        ZStack(alignment: .topLeading){
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu{
                ZStack{
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture{
                    withAnimation(.easeInOut){
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? .white : .clear )
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button{
                    showMenu.toggle()
                }label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    
                }label: {
                    Image(systemName: "goforward")
                }
            }
        }
        .onAppear{
            showMenu = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}
