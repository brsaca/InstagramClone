//
//  UserImage.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 21/09/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        case .xLarge: return 80
        }
    }
}

struct UserImage: View {
    /// Properties
    let user: User?
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundColor(.gray)
        }
    }
}

struct UserImage_Previews: PreviewProvider {
    static var previews: some View {
        UserImage(user:User.MOCK_USERS[0], size: ProfileImageSize.small)
    }
}

struct UserImage_Empty_Previews: PreviewProvider {
    static var previews: some View {
        UserImage(user:User.MOCK_USERS[4], size: ProfileImageSize.small)
    }
}
