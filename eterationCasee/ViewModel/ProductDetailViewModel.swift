//
//  ProductDetailViewModel.swift
//  eterationCase
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

import Foundation

@MainActor
class ProductDetailViewModel: ObservableObject {
    @Published var isFavorite: Bool = false
    let product: Product

    private let cartViewModel: CartViewModel
    private let favoritesViewModel: FavoritesViewModel

    init(product: Product, cartViewModel: CartViewModel, favoritesViewModel: FavoritesViewModel) {
        self.product = product
        self.cartViewModel = cartViewModel
        self.favoritesViewModel = favoritesViewModel
        self.isFavorite = favoritesViewModel.isFavorite(product: product)
    }

    func toggleFavorite() {
        if isFavorite {
            favoritesViewModel.removeFromFavorites(product)
        } else {
            favoritesViewModel.addToFavorites(product)
        }
        isFavorite.toggle()
    }

    func addToCart() {
        cartViewModel.addToCart(product: product)
    }
}
