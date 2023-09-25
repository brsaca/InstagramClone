//
//  Add EmailView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import SwiftUI

struct Add_EmailView: View {
    /// Properties
    @State private var email: String = String()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (alignment: .center, spacing: 10) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("You'll use this email to sign in to your account.")
                .foregroundColor(.gray)
                .font(.footnote)
                .multilineTextAlignment(.center)
            
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 24)
                .padding(.vertical, 24)
            
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

struct Add_EmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Add_EmailView()
        }
    }
}
