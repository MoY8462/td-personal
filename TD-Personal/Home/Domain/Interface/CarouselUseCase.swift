//
//  CarouselUseCase.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 21/05/25.
//

import Foundation

protocol CarouselUseCase {
    func execute() async -> Result<CarouselDTO, NSError>
}
