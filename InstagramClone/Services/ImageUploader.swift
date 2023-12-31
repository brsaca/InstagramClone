//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 26/09/23.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadUserImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: ImageUploader failed to upload image with error: \(error.localizedDescription)")
            return nil
        }
    }
    
    static func uploadPostImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else {
            print("ERROR: uploadPostImage imageData")
            return nil
        }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/post_images/\(filename)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            print("DEBUG: uploadPostImage url \(url.absoluteString)")
            return url.absoluteString
        } catch {
            print("ERROR: ImageUploader failed to upload image with error: \(error.localizedDescription)")
            return nil
        }
    }
}
