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

    var totalItemCount: Int {
        cartItems.reduce(0) { $0 + $1.quantity }
    }

    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
        saveCart()
    }

    func updateQuantity(item: CartItem, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.product.id == item.product.id }) {
            if quantity <= 0 {
                cartItems.remove(at: index)
            } else {
                cartItems[index].quantity = quantity
            }
        }
        saveCart()
    }

    func removeItem(item: CartItem) {
        cartItems.removeAll { $0.product.id == item.product.id }
        saveCart()
    }

    func calculateTotal() -> String {
        let total = cartItems.reduce(0.0) { result, cartItem in
            return result + (cartItem.product.numericPrice * Double(cartItem.quantity))
        }
        return String(format: "%.2f₺", total)
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
