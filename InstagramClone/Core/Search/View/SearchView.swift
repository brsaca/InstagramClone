//
//  SearchView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 21/09/23.
//

import SwiftUI

struct SearchView: View {
    /// Properties
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading){
                    ForEach(0 ... 10 , id:\.self) { user in
                        HStack {
                            UserImage()
                            
                            VStack(alignment: .leading){
                                Text("brsaca")
                                    .fontWeight(.semibold)
                                
                                Text("Brenda Saavedra")
                            }
                            .font(.footnote)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SearchView()
        }
    }
}
