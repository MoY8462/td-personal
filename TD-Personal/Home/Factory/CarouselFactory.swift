//
//  CarouselFactory.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 21/05/25.
//

import Foundation

class CarouselFactory {
    static func getCarouselNetworking() -> CarouselNetworking {
        return CarouselNetworkingMock()
    }
    
    static func getCarouselDataSource() -> CarouselDataSource {
        return CarouselDataSourceImp(carouselNetworking: getCarouselNetworking())
    }
    
    static func getCarouselRepository() -> CarouselRepository {
        return CarouselRepositoryImp(carouselDataSource: getCarouselDataSource())
    }
    
    static func build() -> CarouselUseCase {
        return CarouselUseCaseImpl(repository: getCarouselRepository())
    }
}
