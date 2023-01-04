//
//  ProductDetailViewControllerTests.swift
//  YStoresTests
//
//  Created by Prateek Juneja on 03/01/23.
//

import XCTest
@testable import YStores

class ProductDetailViewControllerTests: XCTestCase {
    
    var sut: ProductDetailViewController!
    
    override func setUpWithError() throws {
        sut = (NavigationLocator.productDetail(MockProduct.getSingleProduct()).getNavigationController() as! ProductDetailViewController)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testViewDidLoad_Controller_shouldNotBeNil() {
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut)
    }
    
    func testViewModel_shouldNotBeNil() {
        XCTAssertNotNil(sut.viewModel)
    }
    
    func testProductDeatils_shouldNotBeNil() {
        XCTAssertNotNil(sut.viewModel?.product)
    }
    
}
