//
//  IGTextButtonModifier.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 25/09/23.
//

import SwiftUI

struct IGTextButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 360, height: 44)
            .background(Color(.systemBlue))
            .cornerRadius(8)
    }
}
