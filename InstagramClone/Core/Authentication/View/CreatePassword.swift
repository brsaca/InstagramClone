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
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
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
            
            SecureField("Password", text: $viewModel.password)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
                .padding(.vertical, 20)
            
            NavigationLink {
                CompleteSignUpView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .modifier(IGTextButtonModifier())
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

