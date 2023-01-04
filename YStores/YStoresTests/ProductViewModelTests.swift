//
//  ProductViewModelTests.swift
//  YStoresTests
//
//  Created by Prateek Juneja on 23/12/22.
//

import XCTest
@testable import YStores

final class ProductViewModelTests: XCTestCase {
    
    var sut: ProductViewModel!
    var urlSession: URLSession = URLSession.init(configuration: .default)
    
    override func setUpWithError() throws {
        urlSession = URLSession.init(configuration: MockAPIResponse.getSessionConfiguration())
        sut = ProductViewModel()
        NetworkManager.urlSession = urlSession
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testProductListApiSuccess() async {
        let mockedData = TestJsonReaderHelper.readJSONFrom(fileName: "MockProductList") as? [String: Any] ?? [:]
        MockAPIResponse.setMock(response: mockedData,
                                requestUrl: MockAPIResponse.getMockUrl(),
                                statusCode: HttpStatusCode.success.rawValue)
        do {
            try await sut.loadAllProducts()
            XCTAssertEqual(sut.products.count, 5)
        } catch {
            XCTFail("Unable to load the product list")
        }
    }
    
    func testProductListApiFailure() async {
        MockAPIResponse.setMock(response: [:],
                                requestUrl: MockAPIResponse.getMockUrl(),
                                statusCode: HttpStatusCode.badRequest.rawValue)
        do {
            try await sut.loadAllProducts()
            XCTAssertEqual(sut.products.count, 0)
        } catch {
            XCTFail("Unable to load the product list")            }
        
    }
        
}
