//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 26/09/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    /// properties
    let user: User
    @StateObject private var viewModel = EditProfileViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            /// toolbar
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        Task { try await viewModel.updateUserData() }
                        dismiss()
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                /// edit profile pic
                PhotosPicker(selection: $viewModel.selectedItem) {
                    VStack {
                        UserImage(user: user, size: .xLarge)
                        
                        Text("Edit profile picture")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.vertical, 8)
                
                /// edit profile info
                VStack {
                    EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $viewModel.fullname)
                    EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
                }
                
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCK_USERS[4])
    }
}
