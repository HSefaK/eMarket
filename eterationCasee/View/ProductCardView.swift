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
                    image.resizable().aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                .frame(height: 120)
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

            Text(product.name)
                .font(.headline)

            Text("\(product.price)₺")
                .font(.subheadline)
                .foregroundColor(.blue)

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
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
