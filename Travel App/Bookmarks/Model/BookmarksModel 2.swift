//
//  BookmarksModel.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import Foundation
import CoreData


class BookmarksModel {
    
    // Fetch data func
    func get() -> [BookmarksEntity] {
        let fetchRequest: NSFetchRequest<BookmarksEntity> = BookmarksEntity.fetchRequest()
        
        do {
            let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
            let sorter = NSSortDescriptor(key: #keyPath(BookmarksEntity.bookmarkSorter), ascending: false)
            fetchRequest.sortDescriptors = [sorter]
            // Limit ile ekrana gelecek veriyi sınırlandırabiliyoruz
            // fetchRequest.fetchLimit = 2
            let results = try context.fetch(fetchRequest)
            return results
        }catch {
            print(error.localizedDescription)
            return []
        }
    }
}
