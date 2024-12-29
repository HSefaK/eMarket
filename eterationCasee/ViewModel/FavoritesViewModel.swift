//
//  FavoritesViewModel.swift
//  eterationCasee
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

import Combine
import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favorites: [Product] = [] {
        didSet {
            saveFavorites()
        }
    }

    init() {
        loadFavorites()
    }

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

    private func saveFavorites() {
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: "favorites")
        }
    }

    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: "favorites"),
           let items = try? JSONDecoder().decode([Product].self, from: data) {
            favorites = items
        }
    }
}
