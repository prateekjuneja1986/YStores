//
//  ProductListViewControllerTests.swift
//  YStoresTests
//
//  Created by Prateek Juneja on 23/12/22.
//

import XCTest
@testable import YStores

class ProductListViewControllerTests: XCTestCase {
    
    var sut: ProductListViewController!
    
    override func setUpWithError() throws {
        sut = (NavigationLocator.productList.getNavigationController() as! ProductListViewController)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testViewDidLoad_CollectionViewDelegateAndDataSource_shouldNotBeNil() {
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.productCollectionView.delegate)
        XCTAssertNotNil(sut.productCollectionView.dataSource)
    }
    
    func testProductDetailView_ForProductData_WithPropertyInjection() {
        let productDetailViewController = NavigationLocator.productDetail(MockProduct.getSingleProduct()).getNavigationController() as! ProductDetailViewController
        XCTAssertNotNil(productDetailViewController)
        XCTAssertNotNil(productDetailViewController.viewModel?.product)
    }
    
    
}
