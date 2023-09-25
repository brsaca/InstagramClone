//
//  Post.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Date
    let user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: User.MOCK_USERS[0].id, caption: "Yeah is me!", likes: 10, imageUrl: "joss", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: User.MOCK_USERS[1].id, caption: "Another caption", likes: 8, imageUrl: "cloe", timestamp: Date(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: User.MOCK_USERS[2].id, caption: "Keep doing tests", likes: 7, imageUrl: "bren", timestamp: Date(), user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, ownerUid: User.MOCK_USERS[3].id, caption: "Yeah is me!", likes: 5, imageUrl: "joss", timestamp: Date(), user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: User.MOCK_USERS[4].id, caption: "Yeah is me!", likes: 9, imageUrl: "allan", timestamp: Date(), user: User.MOCK_USERS[4]),
        .init(id: NSUUID().uuidString, ownerUid: User.MOCK_USERS[0].id, caption: "Yeah is me!", likes: 0, imageUrl: "cloe", timestamp: Date(), user: User.MOCK_USERS[0])
        
    ]
}
