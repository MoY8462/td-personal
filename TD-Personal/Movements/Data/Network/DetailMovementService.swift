//
//  DetailMovementService.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 30/01/25.
//

import Foundation

protocol DetailMovementService {
    func fetchDetailMovement(numeroEmpleado: String, idMovimiento: String, completion: @escaping (Result<DetailMovementResponse, Error>) -> Void)
}

class DetailMovementServiceImpl: DetailMovementService {
    private let apiClient: DetailMovementAPIClientProtocol

    init(apiClient: DetailMovementAPIClientProtocol = DetailMovementAPIClient.shared) {
        self.apiClient = apiClient
    }

    func fetchDetailMovement(numeroEmpleado: String, idMovimiento: String, completion: @escaping (Result<DetailMovementResponse, Error>) -> Void) {
        let endpoint = "https://api.example.com/movements?numeroEmpleado=\(numeroEmpleado)&idMovimiento=\(idMovimiento)"
        apiClient.request(endpoint: endpoint, completion: completion)
    }
}
