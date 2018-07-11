//
//  SwiftProtocolInjectionTests.swift
//  SwiftProtocolInjectionTests
//
//  Created by Grant Davis on 7/10/18.
//  Copyright © 2018 Grant Davis Interactive, LLC. All rights reserved.
//

import XCTest
@testable import SwiftProtocolInjection

// Custom Test Mock object
class TestableDataStore: DataStoreService {
    override func fetchData() -> String {
        return "test data"
    }
}

// Instance of our mock object
private var testStore = TestableDataStore()

// Reimplement the protocol's property we want to override to use a mock object
extension HasDataStore {
    var dataStore: DataStoreService {
        return testStore
    }
}

class SwiftProtocolInjectionTests: XCTestCase, HasDataStore {

    func testProtocolExtensionMockObject() {
        let result = dataStore.fetchData()
        XCTAssertEqual(result, "test data")
    }
}
