//
//  CurrentUserProfileViewModel.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 26/09/23.
//

import Foundation
import Combine

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    func logout() {
        AuthService.shared.signOut()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink{ [weak self] user in
            self?.currentUser = user
            print("DEBUG: User in CurrentUserProfileViewModel from combine is \(String(describing: user))")
        }.store(in: &cancellables)
    }
}
