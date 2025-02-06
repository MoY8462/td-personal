//
//  MockDetailMovementService.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 30/01/25.
//

import Foundation

class MockDetailMovementService: DetailMovementService {
    func fetchDetailMovement(numeroEmpleado: String, idMovimiento: String, completion: @escaping (Result<DetailMovementResponse, Error>) -> Void) {
        let mockResponse = DetailMovementResponse(
            status: "success",
            data: DetailMovementData(
                id: 123,
                nombramiento: "Prórroga para ayudante de profesor de asignatura “A”",
                fecha: "2023-10-01T00:00:00Z",
                status: [
                    DetailMovementStatus(id: 1, state: .empty, nombreMovimiento: "Fin de propuesta", fecha: "", contenido: "Se ha terminado la propuesta de nombramiento"),
                    DetailMovementStatus(id: 2, state: .empty, nombreMovimiento: "Firma de contrato", fecha: "", contenido: "Se ha firmado el contrato"),
                    DetailMovementStatus(id: 3, state: .error, nombreMovimiento: "Validación de documentación", fecha: "2023-10-01T00:00:00Z", contenido: "Falta documentación"),
                    DetailMovementStatus(id: 4, state: .last, nombreMovimiento: "Alta de documentación", fecha: "2023-10-01T00:00:00Z", contenido: "Falta documentación"),
                    DetailMovementStatus(id: 5, state: .last, nombreMovimiento: "Inicio de propuesta", fecha: "2023-10-01T00:00:00Z", contenido: "Se ha iniciado la propuesta de nombramiento")
                ]
            ),
            error: nil
        )
        completion(.success(mockResponse))
    }
}
