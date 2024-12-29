//
//  Product.swift
//  eterationCase
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

struct Product: Identifiable, Codable {
    let id: String
    let name: String
    let price: String
    let image: String
    let description: String

    var numericPrice: Double {
        // Fiyatı sadece sayı kısmını alarak Double'a dönüştürüyoruz
        let cleanedPrice = price.replacingOccurrences(of: "[^0-9.]", with: "", options: .regularExpression)
        return Double(cleanedPrice) ?? 0.0
    }
}
