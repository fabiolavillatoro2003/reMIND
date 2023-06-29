//
//  DataController.swift
//  reMIND
//
//  Created by Fabiola Villatoro on 6/27/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "RemindModel")
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved.")
        } catch {
            print("We could not save the data.")
        }
    }
    
    func addReMINDer(importance: Double, name: String, quote: String, context: NSManagedObjectContext){
        let reminder = ReMINDer(context: context)
        reminder.date = Date()
        reminder.id = UUID()
        reminder.name = name
        reminder.quote = quote
        reminder.importance = importance
        
        save(context: context)
    }
    
    func editReMINDer(reminder: ReMINDer, importance: Double, name: String, quote: String, context: NSManagedObjectContext ) {
        reminder.date = Date()
        reminder.name = name
        reminder.quote = quote
        reminder.importance = importance
        
        save(context: context)
    }
    
    
    
}
