//
//  PhotoListView.swift
//  o2hPracktical
//
//  Created by Hardik Modha on 05/05/26.
//

import SwiftUI
import Kingfisher

struct PhotoListView: View {
    
    @State private var viewModel: PhotoViewModel = .init()
    
    private let columns: [GridItem] = [
        .init(.flexible(), spacing: 8),
        .init(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.photos, id: \.id) { photo in
                        KFImage(photo.urls.imageUrl)
                            .cacheMemoryOnly(false)
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .clipShape(.rect)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 8)
            }
            .navigationTitle("Photos")
            .task {
                await viewModel.fetch()
            }
        }
    }
}

#Preview {
    PhotoListView()
}
