//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    /// Properties
    @StateObject private var viewModel = CurrentUserProfileViewModel()
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    @State var showEditProfile = false
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == currentUser?.username})
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                /// header
                ProfileHeaderView(user: currentUser, size: ProfileImageSize.xLarge, showEditProfile: $showEditProfile)
                
                /// posts grid view
                if let user = currentUser {
                    PostGridView(user: user)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.logout()
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .foregroundColor(.black)
                    }
                }
            }
            .sheet(isPresented: $showEditProfile) {
                if let user = currentUser {
                    EditProfileView(user: user)
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
