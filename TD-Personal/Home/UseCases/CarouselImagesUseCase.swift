//
//  CarouselImagesUseCase.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

protocol CarouselImagesUseCase {
    func execute(completion: @escaping (Result<[CarouselItem], Error>) -> Void)
}
