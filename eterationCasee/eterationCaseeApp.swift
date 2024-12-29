//
//  eterationCaseeApp.swift
//  eterationCasee
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

// Main App
import SwiftUI

@main
struct eterationCaseeApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(CartViewModel())
                .environmentObject(FavoritesViewModel())
        }
    }
}

// Main Tab View
struct MainTabView: View {
    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        TabView {
            ProductListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }

            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
                .badge(cartViewModel.totalItemCount > 0 ? cartViewModel.totalItemCount : 0) // Badge gösterimi

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
        .onAppear {
            cartViewModel.loadCart() // Uygulama açıldığında cart'ı yükle
        }
    }
}
