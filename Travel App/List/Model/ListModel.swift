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
    var flightList: [Model] = []
    
    func getHotel() {
        let headers: HTTPHeaders = ["X-RapidAPI-Key": "a6e828874emsh494d3e97b3db36fp128bf6jsn4329c9466332", "X-RapidAPI-Host": "hotels4.p.rapidapi.com"]
        AF.request("https://hotels4.p.rapidapi.com/get-meta-data", method: .get, headers: headers).response { response in
            if let data  = response.data {
                do{
                    let result = try JSONDecoder().decode([HotelEntity]?.self, from: data)
                    if let list = result {
                        self.listModelDelegate?.sendData(isSuccess: true)
                        self.hotelList = list
                    }
                }catch{
                    self.listModelDelegate?.sendData(isSuccess: false)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getFlight() {
        let headers: HTTPHeaders = ["X-RapidAPI-Key": "a6e828874emsh494d3e97b3db36fp128bf6jsn4329c9466332", "X-RapidAPI-Host": "flight-radar1.p.rapidapi.com"]
        AF.request("https://flight-radar1.p.rapidapi.com/aircrafts/list", method: .get, headers: headers).response { response in
            if let data  = response.data {
                do{
                    let result = try JSONDecoder().decode(Flights.self, from: data)
                    self.listModelDelegate?.sendData(isSuccess: true)
                    guard let rowList = result.rows else { return }
                    let binaryModelList = rowList.map { $0.models }
                    var modelList: [Model] = []
                    for i in binaryModelList {
                        for j in i! {
                            modelList.append(j)
                        }
                    }
                    self.flightList = modelList
                }catch{
                    self.listModelDelegate?.sendData(isSuccess: false)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
}
