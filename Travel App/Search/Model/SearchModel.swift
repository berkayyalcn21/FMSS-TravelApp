//
//  searchModel.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import Foundation
import Alamofire

protocol SearchModelToSearchVMProtocol: AnyObject {
    func sendData(_ isCompleted: Bool)
}

class SearchModel {
    
    weak var searchModelDelegate: SearchModelToSearchVMProtocol?
    var hotelList: [HotelEntity]?
    var flightList: [Model]?
    var model = ListModel()
    
    func getHotel() {
        model.getHotel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) { [weak self] in
            guard let self = self else { return }
            self.hotelList = self.model.hotelList
        }
    }
    
    func getFlight() {
        model.getFlight()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) { [weak self] in
            guard let self = self else { return }
            self.flightList = self.model.flightList
        }
    }
}
