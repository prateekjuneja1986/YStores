//
//  ProductDetailViewModelTests.swift
//  YStoresTests
//
//  Created by Prateek Juneja on 23/12/22.
//

import XCTest
@testable import YStores

class ProductDetailViewModelTests: XCTestCase {
    
    var sut: ProductDetailViewModel!
    
    override func setUpWithError() throws {
        sut = ProductDetailViewModel(product: MockProduct.getSingleProduct())
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testFormattedPrice() {
        XCTAssertEqual(sut.product.formattedPrice, "$549")
        XCTAssertNotEqual(sut.product.formattedPrice, "549")
    }
}
