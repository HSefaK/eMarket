//
//  eterationCaseeApp.swift
//  eterationCasee
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

// Main App
import SwiftUI

@main
struct EMarketApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(CartViewModel())
        }
    }
}

// Main Tab View
struct MainTabView: View {
    @StateObject private var favoritesViewModel = FavoritesViewModel()

    var body: some View {
        TabView {
            ProductListView()
                .environmentObject(favoritesViewModel)
                .tabItem {
                    Label("Products", systemImage: "house")
                }

            FavoritesView()
                .environmentObject(favoritesViewModel)
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }

            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}
