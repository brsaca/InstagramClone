//
//  Post.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Hashable, Codable {
    @DocumentID var postId: String?
    let ownerUid: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    
    var id: String {
        return postId ?? NSUUID().uuidString
    }
    
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(ownerUid: User.MOCK_USERS[0].id, caption: "Yeah is me!", likes: 10, imageUrl: "joss", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(ownerUid: User.MOCK_USERS[1].id, caption: "Another caption", likes: 8, imageUrl: "cloe", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        .init(ownerUid: User.MOCK_USERS[2].id, caption: "Keep doing tests", likes: 7, imageUrl: "bren", timestamp: Timestamp(), user: User.MOCK_USERS[2]),
        .init(ownerUid: User.MOCK_USERS[3].id, caption: "Yeah is me!", likes: 5, imageUrl: "joss", timestamp: Timestamp(), user: User.MOCK_USERS[3]),
        .init(ownerUid: User.MOCK_USERS[4].id, caption: "Yeah is me!", likes: 9, imageUrl: "allan", timestamp: Timestamp(), user: User.MOCK_USERS[4]),
        .init(ownerUid: User.MOCK_USERS[0].id, caption: "Yeah is me!", likes: 0, imageUrl: "cloe", timestamp: Timestamp(), user: User.MOCK_USERS[0])
        
    ]
}
