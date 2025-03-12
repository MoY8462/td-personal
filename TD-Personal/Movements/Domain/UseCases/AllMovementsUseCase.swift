//
//  FetchDataUseCase.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 06/01/25.
//

import Foundation

protocol AllMovementsUseCase {
    func execute(for empleado: Int, completion: @escaping (Result<[MovimientoEntity], Error>) -> Void)
}

class AllMovementsUseCaseImpl: AllMovementsUseCase {
    private let repository: DataRepository

    init(repository: DataRepository) {
        self.repository = repository
    }

    func execute(for empleado: Int, completion: @escaping (Result<[MovimientoEntity], Error>) -> Void) {
        repository.fetchData(for: empleado, completion: completion)
    }
}
