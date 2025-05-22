//
//  CarouselDataSourceImp.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

class CarouselDataSourceImp: CarouselDataSource {
    var carouselNetworking: CarouselNetworking
    
    init(carouselNetworking: CarouselNetworking) {
        self.carouselNetworking = carouselNetworking
    }
    
    func execute() async -> Result<CarouselDTO, NSError> {
        let result = await carouselNetworking.execute()
        switch result {
        case .success(let dto):
            return .success(dto)
        case .failure(let error):
            return .failure(error)
        }
    }
}
