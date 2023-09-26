//
//  UserService.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 26/09/23.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
    
    func reset() {
        self.currentUser = nil
    }
    
    @MainActor
    func updateUserProfileImage(witImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "profileImageUrl":imageUrl
        ])
        self.currentUser?.profileImageUrl = imageUrl
    }
    
    @MainActor
    static func fetchUser(withUid uid:String) async throws -> User? {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        return user
    }
    
}
