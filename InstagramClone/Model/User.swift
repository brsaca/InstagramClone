//
//  User.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    let email: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "brsaca", email: "bsc@gmail.com", profileImageUrl: "bren", fullname: "Brenda SC", bio: "iOS Developer keep learning"),
        .init(id: NSUUID().uuidString, username: "cloe", email: "cloe@gmail.com", profileImageUrl: "cloe", fullname: "Cloe Leija", bio: "If you can dream it you can build it"),
        .init(id: NSUUID().uuidString, username: "jonas", email: "joss@gmail.com", profileImageUrl: "joss", fullname: "Jonas Mtz", bio: ""),
        .init(id: NSUUID().uuidString, username: "allan", email: "allan@gmail.com", profileImageUrl: "allan", fullname: "Allan Ibarra", bio: "Painting my life"),
        .init(id: NSUUID().uuidString, username: "leo", email: "leo@gmail.com", profileImageUrl: nil, fullname: nil, bio: "I wish i could travel on time")
    ]
}
