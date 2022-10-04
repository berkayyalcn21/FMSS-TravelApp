//
//  ListVM.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import Foundation

protocol ListVMToListVCProtocol: AnyObject {
    func sendDataIsFinish(_ isSuccess: Bool)
}

class ListVM {
    
    let model = ListModel()
    weak var listVMDelegate: ListVMToListVCProtocol?
    
    init() {
        model.listModelDelegate = self
    }
    
    func didViewLoad() {
        model.getHotel()
    }
    
    func numberOfItems() -> Int {
        return model.hotelList.count
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func getModel(at index: Int) -> HotelEntity {
        let hotel = model.hotelList[index]
        return hotel
    }
}

extension ListVM: ListModelToListVMProtocol {
    func sendData(isSuccess: Bool) {
        if isSuccess {
            listVMDelegate?.sendDataIsFinish(true)
        }else {
            listVMDelegate?.sendDataIsFinish(false)
        }
    }
}
