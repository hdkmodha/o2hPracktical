//
//  ContentView.swift
//  o2hPracktical
//
//  Created by Hardik Modha on 04/05/26.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(AuthViewModel.self) var viewModel
    
    var body: some View {
        Group {
            switch viewModel.authState {
            case .unknown:
                ProgressView()
            case .authenticated:
                
                TabbarView()
                
                
            case .unauthenticated:
                GoogleSignView()
            }
        }
        .task {
            viewModel.checkLoggedIn()
        }
    }
}

#Preview {
    ContentView()
}
