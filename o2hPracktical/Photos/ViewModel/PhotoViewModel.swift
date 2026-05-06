//
//  PhotoViewModel.swift
//  o2hPracktical
//
//  Created by Hardik Modha on 05/05/26.
//

import Foundation

@MainActor
@Observable
final class PhotoViewModel {
    
    var photos: [Photo] = []
    
    
    func fetch() async {
        
        let result = await APIService.shared.fetch()
        switch result {
        case .success(let photos):
            self.photos = photos
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
