//
//  PostGridViewModel.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 27/09/23.
//

import Foundation

@MainActor
class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    let user: User
    
    init(user: User){
        self.user = user
        Task { try await fetchUserPosts() }
    }
    
    func fetchUserPosts() async throws {
        var posts = try await PostsService.fetchUserPosts(uid: user.id)
        
        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
        
        self.posts = posts
    }
}

