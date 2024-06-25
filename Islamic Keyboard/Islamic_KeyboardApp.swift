//
//  Islamic_KeyboardApp.swift
//  Islamic Keyboard
//
//  Created by Iman Morshed on 6/25/24.
//

import SwiftUI

@main
struct Islamic_KeyboardApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
