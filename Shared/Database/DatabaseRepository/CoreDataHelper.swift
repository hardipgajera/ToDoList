//
//  CoreDataHelper.swift
//  ToDoList (iOS)
//
//  Created by hardip gajera on 13/07/21.
//

import Foundation
import CoreData


class CoreDataHelper {
    
    
    static let shared = CoreDataHelper()
    
    private init() {}
    
    func saveObject(_ managedObject: CoreDataConvertable) {
        _ = managedObject.convertToCoreDataModal()
        PersistenceController.shared.save()
    }
    
    func loadObjects<T: NSManagedObject>(_ request: NSFetchRequest<NSFetchRequestResult>, type: T.Type) throws -> [T] {
        do {
            let fetchResults = try PersistenceController.shared.container.viewContext.fetch(request) as! [T]
            return fetchResults
        } catch {
            throw error
        }
    }
}
