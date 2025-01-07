//
//  DataRepository.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 06/01/25.
//

import Foundation

protocol DataRepository {
    func fetchData(for empleado: Int, completion: @escaping (Result<[MovimientoEntity], Error>) -> Void)
}
