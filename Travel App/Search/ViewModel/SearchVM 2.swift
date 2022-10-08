//
//  searchVM.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import Foundation

protocol SearchVMToSearchVCProtocol: AnyObject {
    func sendDataIsFinish(_ isSuccess: Bool)
}

class SearchVM {
    
    weak var searchVMDelegate: SearchVMToSearchVCProtocol?
    var searchModel = SearchModel()
    var searchButtons: SearchButtons?
    var listVM = ListVM()
    
    init() {
        searchModel.searchModelDelegate = self
    }
    
    enum SearchButtons {
        case hotel
        case flight
    }
    
    func didViewLoad() {
        switch searchButtons {
        case .hotel:
            searchModel.getHotel()
            
        case .flight:
            searchModel.getFlight()
        case .none:
            fatalError("No data")
        }
    }
    
    func numberOfItems() -> Int {
        if searchButtons == .hotel {
            return searchModel.hotelList?.count ?? 0
        }else {
            searchModel.getFlight()
            return searchModel.flightList?.count ?? 0
        }
    }
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func getModel() -> [ListEntity] {
        switch searchButtons {
        case .hotel:
            return makeTransformForHotel(searchModel.hotelList ?? [])
        case .flight:
            return makeTransformForFlight(searchModel.flightList ?? [])
        case .none:
            fatalError("Data not found")
        }
    }
}

extension SearchVM {
    func makeTransformForHotel(_ forHotel: [HotelEntity]) -> [ListEntity] {
        return forHotel.map { .init(listTitle: $0.name, listDesc: $0.hcomLocale) }
    }
    
    func makeTransformForFlight(_ forFlight: [Model]) -> [ListEntity] {
        return forFlight.map { .init(listTitle: $0.name, listDesc: $0.code) }
    }
}

extension SearchVM: SearchModelToSearchVMProtocol {
    
    func sendData(_ isCompleted: Bool) {
        if isCompleted {
            searchVMDelegate?.sendDataIsFinish(true)
        }else {
            searchVMDelegate?.sendDataIsFinish(false)
        }
    }
}
