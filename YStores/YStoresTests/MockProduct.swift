//
//  MockProduct.swift
//  YStoresTests
//
//  Created by Prateek Juneja on 23/12/22.
//

import XCTest
@testable import YStores

struct MockProduct: ProductResponseProtocol {
    
    var id: Int?
    var title, productDescription: String?
    var price: Int?
    var rating: Double?
    var thumbnail: String?
    
    static func getSingleProduct() -> MockProduct {
        let productDescription = "An apple mobile which is nothing like apple"
        let productThumbUrl = "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
        let product = MockProduct(id: 1, title: "iPhone 9", productDescription: productDescription, price: 549, rating: 4.69, thumbnail: productThumbUrl)
        return product
    }
}
