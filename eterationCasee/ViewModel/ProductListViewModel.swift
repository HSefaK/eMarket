//
//  ProductListViewModel.swift
//  eterationCase
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

import Combine
import Foundation

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var displayedProducts: [Product] = []
    @Published var searchText = ""
    @Published var isLoadingMore = false
    @Published var currentPage = 1
    private let itemsPerPage = 4

    init() {
        fetchProducts()
    }

    func fetchProducts() {
        NetworkManager.shared.fetchProducts { [weak self] result in
            switch result {
            case .success(let products):
                self?.products = products
                self?.loadMoreProducts()
            case .failure(let error):
                print("Error fetching products: \(error)")
            }
        }
    }

    func loadMoreProducts() {
        guard !isLoadingMore else { return }
        isLoadingMore = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let startIndex = (self.currentPage - 1) * self.itemsPerPage
            let endIndex = min(startIndex + self.itemsPerPage, self.products.count)
            if startIndex < endIndex {
                self.displayedProducts.append(contentsOf: self.products[startIndex..<endIndex])
                self.currentPage += 1
            }
            self.isLoadingMore = false
        }
    }

    func searchProducts() {
        if searchText.isEmpty {
            displayedProducts = Array(products.prefix(currentPage * itemsPerPage))
        } else {
            displayedProducts = products.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}
