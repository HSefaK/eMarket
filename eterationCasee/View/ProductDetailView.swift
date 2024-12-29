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
        VStack {
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: product.image)) { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray
                }
                .frame(height: 300)
                
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
                .font(.title)

            Text("\(product.price)₺")
                .font(.title2)
                .foregroundColor(.blue)

            Spacer()

            Button("Add to Cart") {
                cartViewModel.addToCart(product: product)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}
