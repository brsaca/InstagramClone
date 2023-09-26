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
    
    init(user: User?, size: ProfileImageSize) {
        self.user = user
        self.size = size
    }
    
    var body: some View {
        VStack(spacing: 10){
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
                Text(user?.fullname ?? "")
                    .fontWeight(.semibold)
                
                Text(user?.bio ?? "")
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
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0], size: ProfileImageSize.small
        )
    }
}
