//
//  FavoritesView.swift
//  eterationCasee
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: FavoritesViewModel

    var body: some View {
        NavigationView {
            List(viewModel.favorites) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    HStack {
                        AsyncImage(url: URL(string: product.image)) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)

                        VStack(alignment: .leading) {
                            Text(product.name)
                                .font(.headline)

                            Text("\(product.price)₺")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
