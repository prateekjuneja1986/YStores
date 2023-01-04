//
//  ImageLoaderTests.swift
//  YStoresTests
//
//  Created by Prateek Juneja on 23/12/22.
//

import XCTest
import Foundation
@testable import YStores

class ImageLoaderTests: XCTestCase {

    var sut: ImageLoader?
    
    override func setUpWithError() throws {
        sut = ImageLoader.shared
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - Success scenario
    // MARK: -
    func testImageDownload_Success() async {
        guard let testImageURL = URL(string: "https://i.dummyjson.com/data/products/1/thumbnail.jpg") else {
            return
        }
        do {
            let image = try await sut?.loadImage(for: testImageURL)
            XCTAssertNotNil(image)
            
            if let image = image {
                sut?.cacheImage(image, for: testImageURL)
            }
            let cachedImage = sut?.getCachedImage(for: testImageURL)
            XCTAssertNotNil(cachedImage, "error while fetching image from cache")
        } catch let error {
            XCTAssertNotNil(error, "No error while downloading image")
            XCTFail("Failed to download image")
        }
    }
    
    // MARK: - Failure scenario
    // MARK: -
    // Bad URL for image for testing bad request for image downloading.
    func testImageDownload_Failure() async {
        guard let testImageURL = URL(string: "https://i.dummyjson.com/data/products/1/thumbnail.jpg") else {
            return
        }
        do {
            _ = try await sut?.loadImage(for: testImageURL)
        } catch let error {
            XCTAssertNotNil(error, "No error while downloading image")
            if let error = error as? APIError {
                XCTAssertEqual(error, APIError.badRequest)
            }
        }
    }

}
