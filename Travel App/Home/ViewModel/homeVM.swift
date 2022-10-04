//
//  homeVM.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import Foundation

protocol HomeVMToHomeVCProtocol: AnyObject {
    func sendDataIsFinish(_ isSuccess: Bool)
}

class HomeVM {
    
    let model = HomeModel()
    weak var viewModelDelegate: HomeVMToHomeVCProtocol?
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    
    func numberOfItems() -> Int {
        return model.articlesList.count
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func getModel(at index: Int) -> Article {
        let article = model.articlesList[index]
        return article
    }

}

extension HomeVM: HomeModelToHomeVMProtocol {
    func sendData(isSuccess: Bool) {
        if isSuccess {
            viewModelDelegate?.sendDataIsFinish(true)
        }else {
            viewModelDelegate?.sendDataIsFinish(false)
        }
    }
}
