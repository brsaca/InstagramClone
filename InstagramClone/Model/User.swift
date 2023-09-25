//
//  User.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "brsaca", profileImageUrl: "bren", fullname: "Brenda SC", bio: "iOS Developer keep learning", email: "bsc@gmail.com"),
        .init(id: NSUUID().uuidString, username: "cloe", profileImageUrl: "cloe", fullname: "Cloe Leija", bio: "If you can dream it you can build it", email: "cloe@gmail.com"),
        .init(id: NSUUID().uuidString, username: "jonas", profileImageUrl: "joss", fullname: "Jonas Mtz", bio: "", email: "joss@gmail.com"),
        .init(id: NSUUID().uuidString, username: "allan", profileImageUrl: "allan", fullname: "Allan Ibarra", bio: "Painting my life", email: "allan@gmail.com"),
        .init(id: NSUUID().uuidString, username: "leo", profileImageUrl: nil, fullname: nil, bio: "I wish i could travel on time", email: "leo@gmail.com")
    ]
}
