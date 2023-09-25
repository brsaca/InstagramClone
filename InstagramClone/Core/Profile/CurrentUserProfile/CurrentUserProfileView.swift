//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    /// Properties
    private var currentUser: User {
        return User.MOCK_USERS[0]
    }
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == currentUser.username})
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                /// header
                ProfileHeaderView(user: currentUser)
                
                /// posts grid view
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CurrentUserProfileView()
        }
    }
}
