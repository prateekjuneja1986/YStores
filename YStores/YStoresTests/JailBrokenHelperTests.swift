//
//  JailBrokenHelperTests.swift
//  YStoresTests
//
//  Created by Prateek Juneja on 03/01/23.
//

import XCTest
@testable import YStores

class JailBrokenHelperTests: XCTestCase {
    
    var sut: JailBrokenHelper!
    
    override func setUpWithError() throws {
        sut = JailBrokenHelper()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testHasCydiaInstalled() {
        XCTAssertFalse(JailBrokenHelper.hasCydiaInstalled())
    }
    
    func testIsContainsSuspiciousApps() {
        XCTAssertFalse(JailBrokenHelper.isContainsSuspiciousApps())
    }
    
    func testIsSuspiciousSystemPathsExists() {
        XCTAssertTrue(JailBrokenHelper.isSuspiciousSystemPathsExists())
    }
    
    func testCanEditSystemFiles() {
        XCTAssertFalse(JailBrokenHelper.canEditSystemFiles())
    }
    
}
