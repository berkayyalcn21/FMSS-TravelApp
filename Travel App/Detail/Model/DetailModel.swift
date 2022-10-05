//
//  DetailModel.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import Foundation
import CoreData

protocol DetailModelToDetailVMProtocol: AnyObject {
    func sendData(isComplete: Bool)
}

class DetailModel {
    
    static var sharedDetail = DetailModel()
    weak var detailModelDelegate: DetailModelToDetailVMProtocol?
    let bookmarksVM = BookmarksVM()
    
    func getArticle() {
        //TODO:
    }
    
    // Save to database(CoreData)
    func post(bookmarkImageView: Data, bookmarkTitle: String, bookmarkDesc: String) {
        
        let managedContext = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let data = BookmarksEntity(context: managedContext)

        data.setValue(UUID(), forKey: "bookmarkID")
        data.setValue(bookmarkImageView, forKey: #keyPath(BookmarksEntity.bookmarkImageView))
        data.setValue(bookmarkTitle, forKey: #keyPath(BookmarksEntity.bookmarkTitle))
        data.setValue(bookmarkDesc, forKey: #keyPath(BookmarksEntity.bookmarkDesc))
        data.setValue(Date(), forKey: #keyPath(BookmarksEntity.bookmarkSorter))

        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    }
    
    // Delete from database(CoreData)
    func delete(name: String) {
        let context = AppDelegate.sharedAppDelegate.coreDataStack.managedContext
        let request: NSFetchRequest<BookmarksEntity> = BookmarksEntity.fetchRequest()
        request.predicate = NSPredicate(format: "bookmarkTitle CONTAINS[cd] %@", name)
        do {
            let itemArray = try context.fetch(request)
            context.delete(itemArray.first!)
        } catch {
            print("Error fetching data from context, \(error)")
        }
        AppDelegate.sharedAppDelegate.coreDataStack.saveContext()
    }

}
