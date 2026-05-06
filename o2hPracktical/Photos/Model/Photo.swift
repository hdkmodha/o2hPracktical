//
//  Photo.swift
//  o2hPracktical
//
//  Created by Hardik Modha on 05/05/26.
//

import Foundation
import Utilities


struct Response: Codable {
    var total: Int
    var totalPages: Int
    var results: [Photo] = []
}

struct Photo: Identifiable, Codable {
    var id: String
    var urls: ImageUrls
    
}

struct ImageUrls: Codable {
    var regular: String
}

extension ImageUrls {
    var imageUrl: URL? {
        return self.regular.toURL
    }
}
