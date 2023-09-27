//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 21/09/23.
//

import SwiftUI

enum Section {
    case feed
    case search
    case uploadPost
    case notifications
    case profile
}

struct MainTabView: View {
    /// Properties
    @State private var selectedIndex = Section.feed
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onAppear {
                    selectedIndex = Section.feed
                }
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(Section.feed)
            
            SearchView()
                .onAppear {
                    selectedIndex = Section.search
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(Section.search)
            
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear {
                    selectedIndex = Section.uploadPost
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }
                .tag(Section.uploadPost)
            
            Text("Notifications")
                .onAppear {
                    selectedIndex = Section.notifications
                }
                .tabItem {
                    Image(systemName: "heart")
                }
                .tag(Section.notifications)
            
            
            CurrentUserProfileView()
                .onAppear {
                    selectedIndex = Section.profile
                }
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(Section.profile)
        }
        .accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
