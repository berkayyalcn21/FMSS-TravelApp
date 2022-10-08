//
//  homeEntity.swift
//  Travel App
//
//  Created by Berkay on 29.09.2022.
//

import Foundation


struct Article: Decodable {
    let id: Int?
    let category: String?
    let images: String?
    let description: String?
    let title: String?
}

struct Articles: Decodable {
    let aritcles: [Article]?
}
