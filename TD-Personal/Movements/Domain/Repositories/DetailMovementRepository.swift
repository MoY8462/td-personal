//
//  DetailMovementRepository.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 30/01/25.
//

import Foundation

protocol DetailMovementRepository {
    func fetchDetailMovement(numeroEmpleado: String, idMovimiento: String, completion: @escaping (Result<DetailMovementData, Error>) -> Void)
}
