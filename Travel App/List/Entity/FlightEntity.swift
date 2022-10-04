//
//  FlightEntity.swift
//  Travel App
//
//  Created by Berkay on 3.10.2022.
//

import Foundation


// MARK: - Welcome
struct Welcome: Codable {
    let version: Int
    let rows: [Row]
}

// MARK: - Row
struct Row: Codable {
    let rowDescription: String
    let models: [Model]

    enum CodingKeys: String, CodingKey {
        case rowDescription = "description"
        case models
    }
}

// MARK: - Model
struct Model: Codable {
    let name, code: String

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case code = "Code"
    }
}
