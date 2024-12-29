//
//  ProductDetailView.swift
//  eterationCase
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Ürün görseli
                ZStack(alignment: .topTrailing) {
                    AsyncImage(url: URL(string: product.image)) { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(height: 300)

                    // Favori butonu
                    Button(action: {
                        if favoritesViewModel.favorites.contains(where: { $0.id == product.id }) {
                            favoritesViewModel.removeFromFavorites(product)
                        } else {
                            favoritesViewModel.addToFavorites(product)
                        }
                    }) {
                        Image(systemName: favoritesViewModel.favorites.contains(where: { $0.id == product.id }) ? "star.fill" : "star")
                            .foregroundColor(.yellow)
                            .padding()
                    }
                }

                // Ürün adı
                Text(product.name)
                    .font(.title)
                    .bold()

                // Ürün fiyatı
                Text("\(product.price)₺")
                    .font(.title2)
                    .foregroundColor(.blue)

                // Ürün açıklaması
                Text("Description")
                    .font(.headline)
                Text(product.description)
                    .font(.body)
                    .foregroundColor(.secondary)

                Spacer()

                // Sepete ekleme butonu
                Button(action: {
                    cartViewModel.addToCart(product: product)
                }) {
                    Text("Add to Cart")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationTitle("Product Details")
    }
}
