//
//  PostsService.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 26/09/23.
//

import Firebase
import FirebaseFirestoreSwift

struct PostsService {
    
    static func uploadPost(_ post: Post) async throws {
        guard let postData = try? Firestore.Encoder().encode(post) else { return }
        try await Firestore.firestore().collection("posts").addDocument(data: postData)
    }
    
    static func fetchPosts() async throws -> [Post] {
        let snapshot = try await Firestore
            .firestore()
            .collection("posts")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Post.self) })
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await Firestore
            .firestore()
            .collection("posts")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        
        let posts = snapshot.documents.compactMap({ try? $0.data(as: Post.self)})
        return posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() } )
    }
    
}
