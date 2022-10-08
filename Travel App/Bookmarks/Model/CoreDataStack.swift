//
//  CoreDataStack.swift
//  Travel App
//
//  Created by Berkay on 5.10.2022.
//

import Foundation
import CoreData


class CoreDataStack {
    
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Unseccessfull container loading... \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        
        do {
            try managedContext.save()
            print("Save success")
        }catch let error as NSError {
            print("Unresolved error \(error)")
        }
    }
    
}
