//
//  CarouselRepository.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

protocol CarouselRepository {
    func fetchCarouselImages(completion: @escaping (Result<EntityCarousel, Error>) -> Void)
}
