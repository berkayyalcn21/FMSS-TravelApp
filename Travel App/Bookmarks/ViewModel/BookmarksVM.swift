//
//  BookmarksVM.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import Foundation


class BookmarksVM {
    
    let bookmarksModel = BookmarksModel()
    
    func didViewLoad() -> [BookmarksEntity] {
        let bookmarks = bookmarksModel.get()
        return bookmarks
    }
}
