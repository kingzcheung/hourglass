//
//  hourglassApp.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/14.
//

import SwiftUI

@main
struct hourglassApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
