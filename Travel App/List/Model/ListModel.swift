//
//  ListModel.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import Foundation
import Alamofire

protocol ListModelToListVMProtocol: AnyObject {
    func sendData(isSuccess: Bool)
}

class ListModel {
    
    weak var listModelDelegate: ListModelToListVMProtocol?
    var hotelList: [HotelEntity] = []
    
    func getHotel() {
        let headers: HTTPHeaders = ["X-RapidAPI-Key": "a6e828874emsh494d3e97b3db36fp128bf6jsn4329c9466332", "X-RapidAPI-Host": "hotels4.p.rapidapi.com"]
        AF.request("https://hotels4.p.rapidapi.com/get-meta-data", method: .get, headers: headers).response { response in
            if let data  = response.data {
                do{
                    let result = try JSONDecoder().decode([HotelEntity]?.self, from: data)
                    if let list = result {
                        self.listModelDelegate?.sendData(isSuccess: true)
                        self.hotelList = list
                        print(self.hotelList)
                    }
                }catch{
                    self.listModelDelegate?.sendData(isSuccess: false)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
}
