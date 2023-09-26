//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 26/09/23.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class EditProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task{ await loadImage() } }
    }
    @Published var profileImage: Image?
    @Published var bio: String = String()
    @Published var fullname: String = String()
    private var uiImage: UIImage?
    
    func updateUserData() async throws {
        Task { try await updateProfileImage() }
        Task { try await updateProfileInfo() }
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    private func updateProfileImage() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try? await ImageUploader.uploadUserImage(image) else { return }
        try await UserService.shared.updateUserProfileImage(witImageUrl: imageUrl)
    }
    
    private func updateProfileInfo() async throws {
        try await UserService.shared.updateUserInfo(withFullname: fullname, bio: bio)
    }
}
