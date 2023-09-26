//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    /// Properties
    @State private var caption: String = String()
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadViewModel()
    @Binding var tabIndex: Section
    
    var body: some View {
        VStack {
            /// action tool bar
            HStack {
                Button {
                    caption = ""
                    viewModel.selectedImage = nil
                    viewModel.selectedImage = nil
                    tabIndex = Section.feed
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            /// post image and caption
            HStack(spacing: 8) {
                if let uploadedImage = viewModel.uploadedImage {
                    uploadedImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }else{
                    Image("empty")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption...", text:$caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant( Section.uploadPost))
    }
}
