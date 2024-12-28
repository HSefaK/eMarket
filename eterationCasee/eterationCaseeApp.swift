//
//  eterationCaseeApp.swift
//  eterationCasee
//
//  Created by Hüseyin Sefa Küçük on 28.12.2024.
//

import SwiftUI

@main
struct eterationCaseeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
