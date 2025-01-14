//
//  EntityCarousel.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

struct EntityCarousel: Codable {
    let status: String
    let data: [CarouselItem]
    let error: String?
}

struct CarouselItem: Codable {
    let id: String
    let imagen: String
    let link: String
}
