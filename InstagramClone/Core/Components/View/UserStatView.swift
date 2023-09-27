//
//  UserStatView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 21/09/23.
//

import SwiftUI

struct UserStatView: View {
    let title: String
    let value: Int

    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
        }
        .frame(width: 80)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(title: "Posts", value: 10)
    }
}
