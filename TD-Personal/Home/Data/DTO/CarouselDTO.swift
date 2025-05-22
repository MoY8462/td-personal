//
//  CarouselDTO.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 21/05/25.
//

import Foundation

struct CarouselDTO: Codable {
    let status: String
    let data: [CarouselItemDTO]
    let error: String?
}

struct CarouselItemDTO: Codable {
    let id: String
    let imagen: String
    let link: String
}
