//
//  FavoritesViewModel.swift
//  eterationCasee
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

import Combine

class FavoritesViewModel: ObservableObject {
    @Published var favorites: [Product] = []

    func addToFavorites(_ product: Product) {
        if !favorites.contains(where: { $0.id == product.id }) {
            favorites.append(product)
        }
    }

    func removeFromFavorites(_ product: Product) {
        favorites.removeAll { $0.id == product.id }
    }
  
  func isFavorite(product: Product) -> Bool {
      return favorites.contains(where: { $0.id == product.id })
  }
}

