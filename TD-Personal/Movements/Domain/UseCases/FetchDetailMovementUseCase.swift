//
//  FetchDetailMovementUseCase.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 30/01/25.
//

import Foundation

protocol FetchDetailMovementUseCase {
    func execute(numeroEmpleado: String, idMovimiento: String, completion: @escaping (Result<DetailMovementData, Error>) -> Void)
}

class FetchDetailMovementUseCaseImpl: FetchDetailMovementUseCase {
    private let repository: DetailMovementRepository

    init(repository: DetailMovementRepository) {
        self.repository = repository
    }

    func execute(numeroEmpleado: String, idMovimiento: String, completion: @escaping (Result<DetailMovementData, Error>) -> Void) {
        repository.fetchDetailMovement(numeroEmpleado: numeroEmpleado, idMovimiento: idMovimiento, completion: completion)
    }
}
