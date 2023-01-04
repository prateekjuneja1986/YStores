//
//  ProductAPIService.swift
//  YStores
//
//  Created by Prateek Juneja on 22/12/22.
//

import Foundation

protocol ProductAPIProtocol {
    func getAllProducts() async throws -> ProductListResponseProtocol
}

enum ProductAPIError: Error {
    case invalidURL
    case invalidResponseFormat
}

final class ProductAPIService: ProductAPIProtocol {
    private let networkManager: NetworkRequestProtocol
    
    init(networkManager: NetworkRequestProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getAllProducts() async throws -> ProductListResponseProtocol {
        guard let apiURL = URL(string: APIConstants.apiURL) else {
            throw ProductAPIError.invalidURL
        }
        let urlRequest = URLRequest(url: apiURL)
        let apiData = try await networkManager.get(request: urlRequest)
        switch apiData {
        case .success(let data):
            let decoder = JSONDecoder()
            do {
                return try decoder.decode(ProdouctListResponse.self, from: data)
            } catch let error {
                print(error.localizedDescription)
                throw ProductAPIError.invalidResponseFormat
            }
        case .failure(let error):
            print(error.localizedDescription)
            throw error
        }
    }
}
