//
//  CreatePassword.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import SwiftUI

import SwiftUI

struct CreatePassword: View {
    /// Properties
    @State private var password: String = String()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (spacing: 10) {
            Text("Create a password")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Your password must be at least 6 characters in length")
                .foregroundColor(.gray)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
                .padding(.vertical, 20)
            
            Button {
                
            } label: {
                Text("Next")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.backward")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct CreatePassword_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreatePassword()
        }
    }
}

