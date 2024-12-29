//
//  ProductListView.swift
//  eterationCase
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

import SwiftUI

struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel()
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText)
                    .onChange(of: viewModel.searchText) { _ in
                        viewModel.searchProducts()
                    }

                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(viewModel.displayedProducts) { product in
                            NavigationLink(destination: ProductDetailView(product: product)) {
                                ProductCardView(product: product)
                                    .environmentObject(favoritesViewModel)
                                    .environmentObject(cartViewModel)
                            }
                        }
                    }
                    .padding()
                    
                    if viewModel.isLoadingMore {
                        ProgressView()
                            .padding()
                    }
                }
            }
            .navigationTitle("E-Market")
        }
    }
}
