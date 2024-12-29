//
//  CartViewModel.swift
//  eterationCase
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

import Combine
import Foundation

class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []

    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
        saveCart()
    }

    func updateQuantity(item: CartItem, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems[index].quantity = quantity
        }
        saveCart()
    }

    func calculateTotal() -> String {
        let total = cartItems.reduce(0) { $0 + (Int($1.product.price) ?? 0) * $1.quantity }
        return "\(total)₺"
    }

    private func saveCart() {
        if let data = try? JSONEncoder().encode(cartItems) {
            UserDefaults.standard.set(data, forKey: "cartItems")
        }
    }

    func loadCart() {
        if let data = UserDefaults.standard.data(forKey: "cartItems"),
           let items = try? JSONDecoder().decode([CartItem].self, from: data) {
            cartItems = items
        }
    }
}
