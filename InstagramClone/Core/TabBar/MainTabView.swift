//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 21/09/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Feed")
                .tabItem {
                    Image(systemName: "house")
                }
            
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            
            
            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }
            
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
