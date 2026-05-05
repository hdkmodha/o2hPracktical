//
//  GoogleSignInView.swift
//  o2hPracktical
//
//  Created by Hardik Modha on 05/05/26.
//

import SwiftUI

struct GoogleSignView: View {
    
    @Environment(AuthViewModel.self) var viewModel
    
    var body: some View {
        Button {
            Task {
                await viewModel.signIn()
            }
        } label: {
            HStack {
                Image(.googlelogo)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Sign In with google")
                    .foregroundStyle(.black)
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.5))
            .clipShape(.capsule)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    GoogleSignView()
}
