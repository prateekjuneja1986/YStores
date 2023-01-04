//
//  ProductViewModel.swift
//  YStores
//
//  Created by Prateek Juneja on 22/12/22.
//

import Foundation
import Combine
import UIKit

class ProductViewModel {
    
    // MARK: - Properties
    //Published
    @Published private(set) var products: [ProductResponseProtocol] = []
    @Published private(set) var isDataLoading: Bool = false
    @Published private(set) var error: Error? = nil
    
    // MARK: - Properties
    // Variables
    private let productAPIService: ProductAPIProtocol
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Custom Initializer
    init(productAPIService: ProductAPIProtocol = ProductAPIService()) {
        self.productAPIService = productAPIService
    }
    
    // MARK: - View Model Helper Methods
    func getProductsCount() -> Int {
        return products.count
    }
    
    func getProducts(for indexPath: IndexPath) -> ProductResponseProtocol? {
        guard indexPath.section == 0, indexPath.row >= 0 else { return nil }
        return products[indexPath.row]
    }
    
    
    func loadAllProducts() async throws {
        self.isDataLoading = true
        do {
            let productsListResponse = try await productAPIService.getAllProducts()
            self.products = productsListResponse.products ?? []
        } catch let error {
            self.error = error
        }
        self.isDataLoading = false
    }
}
