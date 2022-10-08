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
    var hotelOrFlight: WhitchButton?
    var modelDataType: AnyObject?
    
    init() {
        model.listModelDelegate = self
    }
    
    enum WhitchButton {
        case hotel
        case flight
    }
    
    func didViewLoad() {
        switch hotelOrFlight {
        case .hotel:
            model.getHotel()
        case .flight:
            model.getFlight()
        case .none:
            fatalError("Error fetch data (Hotel or Flight)")
        }
    }
    
    func numberOfItems() -> Int {
        switch hotelOrFlight {
        case .hotel:
            return model.hotelList.count
        case .flight:
            return model.flightList.count
        case .none:
            fatalError("List not found")
        }
        
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func getModel(at index: Int) -> ListEntity {
        switch hotelOrFlight {
        case .hotel:
            return transformHotelToList(model.hotelList[index])
        case .flight:
            return transformFlightToList(model.flightList[index])
        case .none:
            fatalError("Data not found")
        }
    }
    
    private func transformHotelToList(_ hotel: HotelEntity) -> ListEntity {
        return .init(listTitle: hotel.name, listDesc: hotel.hcomLocale)
    }
    
    private func transformFlightToList(_ flight: Model) -> ListEntity {
        return .init(listTitle: flight.name, listDesc: flight.code)
    }
}

extension ListVM {
    func makeTransformForHotel(_ forHotel: [HotelEntity]) -> [ListEntity] {
        return forHotel.map { .init(listTitle: $0.name, listDesc: $0.hcomLocale) }
    }
    
    func makeTransformForFlight(_ forFlight: [Model]) -> [ListEntity] {
        return forFlight.map { .init(listTitle: $0.name, listDesc: $0.code) }
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
