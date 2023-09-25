//
//  UserImage.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 21/09/23.
//

import SwiftUI

struct UserImage: View {
    /// Properties
    let user: User
    
    var body: some View {
        if let image = user.profileImageUrl {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .foregroundColor(.gray)
        }
    }
}

struct UserImage_Previews: PreviewProvider {
    static var previews: some View {
        UserImage(user:User.MOCK_USERS[0])
    }
}

struct UserImage_Empty_Previews: PreviewProvider {
    static var previews: some View {
        UserImage(user:User.MOCK_USERS[4])
    }
}
