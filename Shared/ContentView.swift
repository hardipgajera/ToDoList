//
//  ContentView.swift
//  Shared
//
//  Created by hardip gajera on 12/07/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var items: [Task] = []
    
    var body: some View {
        ForEach(items,id: \.title) { item in
            HStack {
                Text(item.title)
                Text(item.task)
            }
        }
        .toolbar {
            #if os(iOS)
            EditButton()
            #endif
        }.onAppear(perform: loadItems)
    }
    
    private func addItems() {
        let task = Task(title: "hardip", task: "gajera", timeStamp: Date())
        CoreDataHelper.shared.saveObject(task)
        
        print("Path: \(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!)")
    }
    
    private func loadItems() {
        self.items = try! CoreDataHelper.shared.loadObjects(NSFetchRequest(entityName: "CDTask"), type: CDTask.self).map(Task.init)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
