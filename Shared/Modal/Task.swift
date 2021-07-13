//
//  Task.swift
//  ToDoList
//
//  Created by hardip gajera on 12/07/21.
//

import Foundation
import CoreData

protocol CoreDataConvertable {
    func convertToCoreDataModal<T: NSManagedObject>() -> T
}

class Task {
    var title: String
    var task: String
    var timeStamp: Date
    
    init(title: String?, task: String?, timeStamp: Date?) {
        self.title = title ?? ""
        self.task = task ?? ""
        self.timeStamp = timeStamp ?? Date()
    }
    
    convenience init(_ CDTask: CDTask) {
        self.init(title: CDTask.title,task: CDTask.task,timeStamp: CDTask.timestamp)
//        self.task =
//        self.title = CDTask.title ?? ""
//        self.timeStamp = CDTask.timestamp ?? Date()
    }
}

extension Task: CoreDataConvertable {

    func convertToCoreDataModal<T>() -> T where T : NSManagedObject {
        let viewContext = PersistenceController.shared.container.viewContext
        let cdTask = NSEntityDescription.insertNewObject(forEntityName: "CDTask", into: viewContext) as! CDTask
        cdTask.id = UUID()
        cdTask.title = title
        cdTask.task = task
        cdTask.timestamp = timeStamp
        return cdTask as! T
    }

}
