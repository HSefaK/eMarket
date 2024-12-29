//
//  CartView.swift
//  eterationCase
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//


import SwiftUI

struct CartView: View {
    @EnvironmentObject var viewModel: CartViewModel

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.cartItems) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.product.name)
                                .font(.headline)
                            Text("\(item.product.price)")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }

                        Spacer()

                        HStack(spacing: 16) {
                            Button(action: {
                                if item.quantity > 1 {
                                    viewModel.updateQuantity(item: item, quantity: item.quantity - 1)
                                } else {
                                    viewModel.removeItem(item: item)
                                }
                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .font(.title3)
                                    .foregroundColor(.blue)
                            }
                            .buttonStyle(BorderlessButtonStyle())

                            Text("\(item.quantity)")
                                .font(.headline)
                                .frame(width: 30, alignment: .center)

                            Button(action: {
                                viewModel.updateQuantity(item: item, quantity: item.quantity + 1)
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title3)
                                    .foregroundColor(.blue)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                    .padding(.vertical, 8)
                }
            }

            HStack {
                Text("Total: \(viewModel.calculateTotal())")
                    .font(.title2)
                    .bold()
                Spacer()
                Button(action: {
                    // Checkout işlemi
                }) {
                    Text("Complete")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .frame(maxWidth: 120)
            }
            .padding()
        }
        .navigationTitle("Cart")
        .onAppear {
            viewModel.loadCart()
        }
    }
}
