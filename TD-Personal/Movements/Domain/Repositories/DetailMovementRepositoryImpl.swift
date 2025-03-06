//
//  DetailMovementRepositoryImpl.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 30/01/25.
//

import Foundation

class DetailMovementRepositoryImpl: DetailMovementRepository {
    private let service: DetailMovementService

    init(service: DetailMovementService) {
        self.service = service
    }

    func fetchDetailMovement(numeroEmpleado: String, idMovimiento: String, completion: @escaping (Result<DetailMovementData, Error>) -> Void) {
        service.fetchDetailMovement(numeroEmpleado: numeroEmpleado, idMovimiento: idMovimiento) { result in
            switch result {
            case .success(let response):
                if let data = response.data {
                    completion(.success(data))
                } else if let error = response.error {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: error])))
                } else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
