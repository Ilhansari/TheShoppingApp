//
//  MockProductService.swift
//  TheShoppingFeedTests
//
//  Created by Ilhan Sari on 11.01.2022.
//

import Foundation
import TheShoppingFeed

public class MockProductService: ProductServiceProtocol {

    public var productsSearchResult: Result<SearchProductsResponse, NetworkError>?

    public func getSearchProduct(query: String,
                                 page: Int,
                                 completion: @escaping (Result<SearchProductsResponse, NetworkError>) -> Void) {
        switch productsSearchResult {
        case .success(let response):
            completion(.success(response))
        case .failure(let error):
            completion(.failure(error))
        case .none:
            break
        }
    }
}
