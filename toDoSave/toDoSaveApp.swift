//
//  toDoSaveApp.swift
//  toDoSave
//
//  Created by Tim Randall on 14/7/21.
//

import SwiftUI

@main
struct toDoSaveApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
