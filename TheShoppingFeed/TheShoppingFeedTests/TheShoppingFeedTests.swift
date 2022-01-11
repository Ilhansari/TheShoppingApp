//
//  TheShoppingFeedTests.swift
//  TheShoppingFeedTests
//
//  Created by Ilhan Sari on 11.01.2022.
//

import XCTest
@testable import TheShoppingFeed

class TheShoppingFeedTests: XCTestCase {

    var mockNetworkManager: MockProductService!

    override func setUp() {
        super.setUp()
        mockNetworkManager = MockProductService()
    }

    override func tearDown() {
        mockNetworkManager = nil
        super.tearDown()
    }

    func test_load_productListEmptyJSON() throws {
        let data = try getData(name: "SearchProductsListEmpty")
        _ = try? JSONDecoder().decode(SearchProductsResponse.self, from: data)
        mockNetworkManager.productsSearchResult = .failure(NetworkError.noData)

        mockNetworkManager.getSearchProduct(query: "", page: 0) { result in
            switch result {
            case .success:
                XCTFail("The test should have returned failure")
            case .failure(let error):
                XCTAssertEqual(error.rawValue, NetworkError.noData.rawValue)
            }
        }
    }

    func test_load_productListSuccessJSONData() throws {
        let data = try getData(name: "SearchProductsList")
        let mockResponse: SearchProductsResponse = try JSONDecoder().decode(SearchProductsResponse.self,
                                                                            from: data)
        mockNetworkManager.productsSearchResult = .success(mockResponse)

        mockNetworkManager.getSearchProduct(query: "Apple", page: 1) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.products, mockResponse.products)
                XCTAssertEqual(response.products.count, 2)
            case .failure:
                XCTFail("The test should have returned success")
            }
        }
    }

    // MARK: - Helpers
    func getData(name: String, withExtension: String = "json") throws -> Data {
        let bundle = Bundle(for: type(of: self))
        let fileUrl = bundle.url(forResource: name, withExtension: withExtension)
        let data = try Data(contentsOf: fileUrl!)
        return data
    }
}
