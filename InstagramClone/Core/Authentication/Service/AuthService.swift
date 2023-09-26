//
//  AuthService.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(
        withEmail email:String,
        password: String
    ) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: AuthService Failed to login with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(
        withEmail email: String,
        password: String,
        username: String
    ) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: AuthService Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        /// signs out on backend
        try? Auth.auth().signOut()
        /// removes session locally and updates routing
        self.userSession = nil
        /// set currentUser to nil
    
    }
}
