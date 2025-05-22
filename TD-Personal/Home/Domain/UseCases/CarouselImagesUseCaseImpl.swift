//
//  CarouselImagesUseCaseImpl.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

class CarouselUseCaseImpl: CarouselUseCase {
    private let repository: CarouselRepository

    init(repository: CarouselRepository) {
        self.repository = repository
    }
    
    func execute() async -> Result<CarouselDTO, NSError> {
        let result = await repository.execute()
        
        switch result {
        case .success(let dto):
            return .success(dto)
        case .failure(let error):
            return .failure(error)
        }
    }
}
