//
//  AddEmailView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import SwiftUI

struct AddEmailView: View {
    /// Properties
    @State private var email: String = String()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (spacing: 10) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("You'll use this email to sign in to your account.")
                .foregroundColor(.gray)
                .font(.footnote)
                .multilineTextAlignment(.center)
            
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
                .padding(.vertical, 20)
            
            NavigationLink {
                CreateUsernameView()
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddEmailView()
        }
    }
}
