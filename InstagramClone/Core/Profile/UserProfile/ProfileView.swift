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
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
    private let dimension: CGFloat = UIScreen.main.bounds.width / 3 - 1
    
    var body: some View {
            ScrollView {
                /// header
                VStack (spacing: 10) {
                    /// pic and stats
                    HStack {
                        Image(user.profileImageUrl ?? "bren")
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
                        if let fullName = user.fullname {
                            Text(fullName)
                                .fontWeight(.semibold)
                        }
                        
                        if let bio = user.bio {
                            Text(bio)
                        }
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
                    LazyVGrid(columns: gridItems, spacing: 1) {
                        ForEach(posts) { post in
                            Image(post.imageUrl)
                                .resizable()
                                .scaledToFill()
                                .frame(width: dimension, height: dimension)
                                .clipped()
                        }
                    }
                }
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
