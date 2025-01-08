//
//  EmpleadoRepository.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 07/01/25.
//

import Foundation

import Foundation

protocol EmpleadoRepository {
    func fetchEmpleado(numeroEmpleado: Int, completion: @escaping (Result<Empleado, Error>) -> Void)
}
