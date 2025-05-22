//
//  CarouselRepository.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

class CarouselRepositoryImp: CarouselRepository {
    var carouselDataSource: CarouselDataSource
    init(carouselDataSource: CarouselDataSource) {
        self.carouselDataSource = carouselDataSource
    }
    func execute() async -> Result<CarouselDTO, NSError> {
        let result = await carouselDataSource.execute()
        switch result {
        case .success(let dto):
            return .success(dto)
        case .failure(let error):
            return .failure(error)
        }
    }
    
}
