//
//  CarouselImagesUseCaseImpl.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

class CarouselImagesUseCaseImpl: CarouselImagesUseCase {
    private let repository: CarouselRepository

    init(repository: CarouselRepository) {
        self.repository = repository
    }

    func execute(completion: @escaping (Result<[CarouselItem], Error>) -> Void) {
        repository.fetchCarouselImages { result in
            switch result {
            case .success(let apiCarousel):
                completion(.success(apiCarousel.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
