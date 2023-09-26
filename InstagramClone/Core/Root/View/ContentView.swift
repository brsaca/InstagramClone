//
//  ContentView.swift
//  InstagramClone
//
//  Created by Brenda Saavedra Cantu on 20/09/23.
//

import SwiftUI

struct ContentView: View {
    /// Properties
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
