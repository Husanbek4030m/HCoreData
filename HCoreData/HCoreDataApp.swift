//
//  HCoreDataApp.swift
//  HCoreData
//
//  Created by Karavella on 10/09/22.
//

import SwiftUI

@main
struct HCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
