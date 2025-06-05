//
//  FocusDropApp.swift
//  FocusDrop
//
//  Created by Wan Lin Yang on 2025/6/5.
//

import SwiftUI

@main
struct FocusDropApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
