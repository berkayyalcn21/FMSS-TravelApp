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

}
