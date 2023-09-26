//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 26/09/23.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText: String = String()
    
    init() {
        Task{ try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
