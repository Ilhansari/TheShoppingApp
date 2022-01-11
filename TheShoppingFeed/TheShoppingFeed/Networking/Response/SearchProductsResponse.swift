//
//  SearchProductsResponse.swift
//  TheShoppingFeed
//
//  Created by Ilhan Sari on 11.01.2022.
//

import Foundation

public struct SearchProductsResponse: Decodable, Equatable {
    public let products: [ProductModel]
}
