//
//  CartItem.swift
//  eterationCase
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

import Foundation

struct CartItem: Identifiable, Codable {
    let id = UUID()
    let product: Product
    var quantity: Int
}

