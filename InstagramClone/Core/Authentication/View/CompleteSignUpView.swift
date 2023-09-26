//
//  CompleteSignUpView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import SwiftUI

struct CompleteSignUpView: View {
    /// Properties
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 12){
            Spacer()
            
            Text("Welcome to Instagram,\("\n")\(viewModel.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text("Click below to complete registration and start using Instagram")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Complete Sign Up")
                    .modifier(IGTextButtonModifier())
            }
            
            Spacer()
        }
    }
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
