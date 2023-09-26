//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 21/09/23.
//

import SwiftUI

struct ProfileView: View {
    /// Properties
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        ScrollView {
            /// header
            ProfileHeaderView(user: user, size: ProfileImageSize.small)
            
            /// posts grid view
            PostGridView(posts: posts)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView(user: User.MOCK_USERS[1])
        }
    }
}
