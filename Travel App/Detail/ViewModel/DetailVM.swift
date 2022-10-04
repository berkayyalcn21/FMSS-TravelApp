//
//  DetailVM.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import Foundation

protocol DetailVMToDetailVCProtocol: AnyObject {
    func sendDataIsFinish(_ isSuccess: Bool)
}

class DetailVM {
    
    let model = DetailModel()
    weak var detailVMDelegate: DetailVMToDetailVCProtocol?
    
    init() {
        model.detailModelDelegate = self
    }
    
    func didViewLoad() {
        
    }
}

extension DetailVM: DetailModelToDetailVMProtocol {
    func sendData(isComplete: Bool) {
        if isComplete {
            detailVMDelegate?.sendDataIsFinish(true)
        }else {
            detailVMDelegate?.sendDataIsFinish(false)
        }
    }
}
