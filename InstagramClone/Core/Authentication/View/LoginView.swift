//
//  LoginView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import SwiftUI

struct LoginView: View {
    /// Properties
    @State private var email: String = String()
    @State private var password: String = String()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                /// logo image
                Image("instagram-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                /// text fields
                VStack {
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    
                    SecureField("Password", text: $password)
                        .modifier(IGTextFieldModifier())
                }
                
                /// buttons
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button {
                    
                } label: {
                    Text("Log in")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
                .padding(.vertical)
                
                HStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width/2 - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width/2 - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                Button {
                    
                } label: {
                    HStack(alignment: .center) {
                        Image("fb")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        Text("Continue with facebook")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.top, 8)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
