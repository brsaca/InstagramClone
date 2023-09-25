//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 21/09/23.
//

import SwiftUI

struct FeedCell: View {
    /// Properties
    let post: Post
    
    var body: some View {
        VStack(spacing: 10) {
            /// image + username
            HStack(spacing: 4) {
                UserImage(user: post.user)
                
                Text(post.user?.username ?? "")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.leading)
            
            /// post image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            /// action buttons
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                .accentColor(.black)
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                .accentColor(.black)
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                .accentColor(.black)
                
                Spacer()
            }.padding(.leading)
            
            /// likes label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 1)
            
            /// caption label
            HStack{
                Text(post.user?.username ?? "")
                    .fontWeight(.semibold) +
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 20)
            .padding(.top, 1)
            
            /// time
            Text("2d ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[0])
    }
}
