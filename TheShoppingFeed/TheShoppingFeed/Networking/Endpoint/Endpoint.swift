//
//  Endpoint.swift
//  TheShoppingFeed
//
//  Created by Ilhan Sari on 11.01.2022.
//

import Foundation

public enum ProductAPI {
    case searchProduct(query: String, page: Int)
}

extension ProductAPI: NetworkProtocol {

    public var baseURL: URL {
        return URL(string: serviceBaseUrl)!
    }

    public var path: String {
        switch self {
        case .searchProduct:
            return "search"
        }
    }

    public var httpMethod: HTTPMethod {
        return .get
    }

    public var task: HTTPTask {
        switch self {
        case .searchProduct(let query, let page):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["query": query,
                                                      "page": page])
        }
    }

    public var headers: HTTPHeaders? {
        return nil
    }
}
