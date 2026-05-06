//
//  APIService.swift
//  o2hPracktical
//
//  Created by Hardik Modha on 05/05/26.
//


import Foundation

enum AppError: Error {
    case invalidURL
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Provide valid url"
        }
    }
    
    
}

final class APIService {
    
    
    static let shared: APIService = APIService()
    
    private init() {}
    
    func fetch() async -> Result<[Photo], Error> {
        
        guard let url = URL(string: Constants.api) else {
            return .failure(AppError.invalidURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response = try decoder.decode(Response.self, from: data)
            return .success(response.results)
        } catch {
            return .failure(error)
        }
    }
}
