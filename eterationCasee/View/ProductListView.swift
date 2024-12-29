//
//  ProductListView.swift
//  eterationCase
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

import SwiftUI

// Product List View
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
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 16) {
                        ForEach(viewModel.displayedProducts) { product in
                            NavigationLink(destination: ProductDetailView(product: product)) {
                                ProductCardView(product: product)
                                    .environmentObject(favoritesViewModel)
                                    .environmentObject(cartViewModel)
                            }
                        }
                    }
                    .padding()
                    .background(GeometryReader { geo -> Color in
                        DispatchQueue.main.async {
                            if geo.frame(in: .global).maxY < UIScreen.main.bounds.height {
                                viewModel.loadMoreProducts()
                            }
                        }
                        return Color.clear
                    })

                    if viewModel.isLoadingMore {
                        ProgressView()
                            .padding()
                    }
                }
                .onAppear {
                    if viewModel.displayedProducts.isEmpty {
                        viewModel.loadMoreProducts()
                    }
                }
            }
            .navigationTitle("E-Market")
        }
    }
}
