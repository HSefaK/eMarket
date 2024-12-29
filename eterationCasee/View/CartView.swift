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
                        Text(item.product.name)
                        Spacer()
                        Stepper(value: Binding(get: {
                            item.quantity
                        }, set: { newValue in
                            viewModel.updateQuantity(item: item, quantity: newValue)
                        }), in: 1...10) {
                            Text("\(item.quantity)")
                        }
                    }
                }
            }

            HStack {
                Text("Total: \(viewModel.calculateTotal())")
                    .font(.title2)
                Spacer()
            }
            .padding()
        }
    }
}
