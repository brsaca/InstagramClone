//
//  CreateUsernameView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import SwiftUI

struct CreateUsernameView: View {
    /// Properties
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack (spacing: 10) {
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Pick a username for your new account. You can always chage it later")
                .foregroundColor(.gray)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            TextField("Username", text: $viewModel.username)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
                .padding(.vertical, 20)
            
            NavigationLink {
                CreatePassword()
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

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreateUsernameView()
        }
    }
}
