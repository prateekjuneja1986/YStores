//
//  ProductAPIResponse.swift
//  YStores
//
//  Created by Prateek Juneja on 22/12/22.
//

import Foundation


// MARK: - ProductResponseProtocol
protocol ProductListResponseProtocol: Codable {
    var products: [ProductAPIResponse]? { get }
}


// MARK: - PrdouctList
struct ProdouctListResponse: ProductListResponseProtocol {
    var products: [ProductAPIResponse]?
}


// MARK: - ProductResponseProtocol
protocol ProductResponseProtocol: Codable {
    var id: Int? { get }
    var title: String? { get }
    var price: Int? { get }
    var productDescription: String? { get }
    var thumbnail: String? { get }
    var rating: Double? { get }
}


// MARK: - ProductAPIResponse
struct ProductAPIResponse: ProductResponseProtocol {
    var id: Int?
    var title, productDescription: String?
    var price: Int?
    var rating: Double?
    var thumbnail: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case productDescription = "description"
        case price, rating, thumbnail
    }
}

extension ProductResponseProtocol {
    var formattedPrice: String {
        if let productPrice = price {
            let productPriceString = "$" + productPrice.description
            return productPriceString
        }
        return ""
    }
}
