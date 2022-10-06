//
//  homeModel.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import Foundation

protocol HomeModelToHomeVMProtocol: AnyObject {
    func sendData(isSuccess: Bool)
}

class HomeModel {
    
    weak var delegate: HomeModelToHomeVMProtocol?
    var articlesList: [Article] = []
    
    func fetchData() {
        guard let path = Bundle.main.path(forResource: "ArticlesData", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(Articles.self, from: data)
            if let list = result.aritcles {
                articlesList = list
                delegate?.sendData(isSuccess: true)
            }
        }catch {
            print(error.localizedDescription)
            delegate?.sendData(isSuccess: false)
        }
    }
}
