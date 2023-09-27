//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 26/09/23.
//

import Foundation
import Combine

@MainActor
class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task{ try await fetchPosts() }
    }
    
    func fetchPosts() async throws {
        self.posts = try await PostsService.fetchPosts()
        try await fetchUserDataForPosts()
    }
    
    private func fetchUserDataForPosts() async throws {
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerId = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerId)
            
            posts[i].user = postUser
        }
    }
}
