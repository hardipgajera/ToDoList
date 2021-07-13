//
//  CDTask+CoreDataProperties.swift
//  ToDoList
//
//  Created by hardip gajera on 12/07/21.
//
//

import Foundation
import CoreData

extension CDTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTask> {
        return NSFetchRequest<CDTask>(entityName: "CDTask")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var task: String?
    @NSManaged public var timestamp: Date?

}

extension CDTask : Identifiable {

    func getTask() -> Task {
        return Task(title: title, task: task, timeStamp: timestamp)
    }
    
}
