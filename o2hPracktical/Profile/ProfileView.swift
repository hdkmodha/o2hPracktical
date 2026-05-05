//
//  ProfileView.swift
//  o2hPracktical
//
//  Created by Hardik Modha on 05/05/26.
//
import FirebaseAuth
import SwiftUI
import Kingfisher


struct ProfileView: View {
    
    @Environment(AuthViewModel.self) var viewModel
    
    var body: some View {
        List {
            if let user = viewModel.currentUser {
                Section {
                    HStack {
                        KFImage(user.photoURL)
                            .cacheMemoryOnly(false)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(.circle)
                        VStack(alignment: .leading) {
                            Text(user.displayName ?? "Unknown")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.black)
                            Text(user.email ?? "-")
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundStyle(.secondary)
                            
                        }
                    }
                }
                
                Section {
                    Button {
                        viewModel.signOut()
                    } label: {
                        Text("Sign Out")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.red)
                    }
                }
            }
        }
        .navigationTitle("Profile")
    }
}

#Preview {
    ProfileView()
}

