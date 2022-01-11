//
//  ProductModel.swift
//  TheShoppingFeed
//
//  Created by Ilhan Sari on 11.01.2022.
//

import Foundation

public struct ProductModel: Decodable, Equatable {
    public let productId: Int
    public let productName: String
    public let productImage: String
}
