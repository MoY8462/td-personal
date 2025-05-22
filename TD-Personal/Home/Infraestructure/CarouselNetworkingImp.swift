//
//  CarouselNetworkingImp.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 21/05/25.
//

import Foundation

class CarouselNetworkingImp: CarouselNetworking {
    
    private let url = URL(string: URLs.carousel.rawValue)!
    
    func execute() async -> Result<CarouselDTO, NSError> {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let dto = try JSONDecoder().decode(CarouselDTO.self, from: data)
            return .success(dto)
        } catch {
            return .failure(error as NSError)
        }
    }
    
}
