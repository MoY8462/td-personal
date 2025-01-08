//
//  FetchEmpleadoUseCase.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 07/01/25.
//

import Foundation

protocol FetchEmpleadoUseCase {
    func execute(numeroEmpleado: Int, completion: @escaping (Result<Empleado, Error>) -> Void)
}

class FetchEmpleadoUseCaseImpl: FetchEmpleadoUseCase {
    private let empleadoRepository: EmpleadoRepository

    init(empleadoRepository: EmpleadoRepository) {
        self.empleadoRepository = empleadoRepository
    }

    func execute(numeroEmpleado: Int, completion: @escaping (Result<Empleado, Error>) -> Void) {
        empleadoRepository.fetchEmpleado(numeroEmpleado: numeroEmpleado, completion: completion)
    }
}
