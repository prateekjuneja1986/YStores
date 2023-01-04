//
//  ProductDetailViewModel.swift
//  YStores
//
//  Created by Prateek Juneja on 23/12/22.
//

import Foundation

class ProductDetailViewModel {
    let product: ProductResponseProtocol

    init(product: ProductResponseProtocol) {
        self.product = product
    }
}
