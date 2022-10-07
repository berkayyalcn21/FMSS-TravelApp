//
//  ListEntity.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import Foundation


// MARK: - WelcomeElement
struct HotelEntity: Decodable {
    let name, posName, hcomLocale: String?
    let accuWeatherLocale: String?
}
