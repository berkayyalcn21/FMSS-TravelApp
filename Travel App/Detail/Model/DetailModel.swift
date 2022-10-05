//
//  DetailModel.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import Foundation

protocol DetailModelToDetailVMProtocol: AnyObject {
    func sendData(isComplete: Bool)
}

class DetailModel {
    
    static var sharedDetail = DetailModel()
    weak var detailModelDelegate: DetailModelToDetailVMProtocol?
    
    func getArticle() {
        
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

}
