//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    /// Properties
    private var currentUser: User? {
        return User.MOCK_USERS[0]
    }
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == currentUser?.username})
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                /// header
                VStack (spacing: 10) {
                    /// pic and stats
                    HStack {
                        Image(currentUser?.profileImageUrl ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            UserStatView(title: "Post", value: 3)
                            
                            UserStatView(title: "Followers", value: 5)
                            
                            UserStatView(title: "Following", value: 20)
                        }
                    }
                    .padding(.horizontal)
                    
                    /// name and bio
                    VStack(alignment: .leading, spacing: 4) {
                        Text(currentUser?.fullname ?? "")
                            .fontWeight(.semibold)
                        
                        Text(currentUser?.bio ?? "")
                    }
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    
                    /// action button
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(
                                    cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    
                    
                    Divider()
                    
                    /// posts grid view
                    PostGridView(posts: posts)
                    
                }
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
