//
//  ToDoListApp.swift
//  Shared
//
//  Created by hardip gajera on 12/07/21.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
