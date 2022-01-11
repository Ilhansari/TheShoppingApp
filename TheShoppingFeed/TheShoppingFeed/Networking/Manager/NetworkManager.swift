//
//  NetworkManager.swift
//  TheShoppingFeed
//
//  Created by Ilhan Sari on 11.01.2022.
//

import Foundation

public protocol ProductServiceProtocol {
    func getSearchProduct(query: String,
                          page: Int,
                          completion: @escaping (Result<SearchProductsResponse, NetworkError>) -> Void)
}

public var serviceBaseUrl: String = ""

public class NetworkManager: ProductServiceProtocol {

    public var baseUrl: String = ""

    private let router = Router<ProductAPI>()

    public init(baseUrl: String) {
        serviceBaseUrl = baseUrl
    }

    public func getSearchProduct(query: String,
                                 page: Int,
                                 completion: @escaping (Result<SearchProductsResponse, NetworkError>) -> Void) {
        router.request(.searchProduct(query: query, page: page)) { (data, response, error) in
            guard error == nil else {
                return completion(.failure(NetworkError.connectionError))
            }

            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let data = data else {
                        return completion(.failure(NetworkError.noData))
                    }
                    guard let apiResponse = try? JSONDecoder().decode(SearchProductsResponse.self,
                                                                      from: data)
                    else {
                        return completion(.failure(NetworkError.unableToDecode))
                    }
                    completion(.success(apiResponse))
                case .failure:
                    completion(.failure(NetworkError.failed))
                }
            }
        }
    }

    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Bool, NetworkError> {
        switch response.statusCode {
        case 200...299: return .success(true)
        case 401...500: return .failure(NetworkError.authenticationError)
        case 501...599: return .failure(NetworkError.badRequest)
        case 600: return .failure(NetworkError.outdated)
        default: return .failure(NetworkError.failed)
        }
    }
}
