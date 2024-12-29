//
//  ProductCardView.swift
//  eterationCasee
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: product.image)) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.gray
                }
                .frame(height: 180) // Sabit görsel yüksekliği
                .cornerRadius(8)

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

            Spacer() // İçeriği eşit şekilde hizalamak için

            Text(product.name)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(2) // Uzun metinleri sınırlamak için

            Text("\(product.price)₺")
                .font(.subheadline)
                .foregroundColor(.blue)

            Spacer()

            Button(action: {
                cartViewModel.addToCart(product: product)
            }) {
                Text("Add to Cart")
                    .font(.callout)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
