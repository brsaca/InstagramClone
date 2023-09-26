//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    /// Properties
    let user: User?
    let size: ProfileImageSize
    @Binding var showEditProfile: Bool
    
    var body: some View {
        VStack(spacing: 10){
            if let user = self.user {
                /// pic and stats
                HStack {
                    UserImage(user: user, size: ProfileImageSize.xLarge)
                    
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
                    Text(user.fullname ?? "")
                        .fontWeight(.semibold)
                    
                    Text(user.bio ?? "")
                }
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                /// action button
                Button {
                    if user.isCurrentUser {
                        showEditProfile.toggle()
                    } else {
                        
                    }
                } label: {
                    Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .background(user.isCurrentUser ? .white : Color(.systemBlue))
                        .foregroundColor(user.isCurrentUser ? .black : .white)
                        .cornerRadius(6)
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: 6)
                            .stroke(user.isCurrentUser ? Color.gray : .clear, lineWidth: 1 )
                        )
                }
            }
            Divider()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0], size: ProfileImageSize.small, showEditProfile: .constant(false)
        )
    }
}
