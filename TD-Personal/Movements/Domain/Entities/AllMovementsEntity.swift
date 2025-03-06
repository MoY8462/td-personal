//
//  AllMovementsEntity.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 06/01/25.
//

import Foundation

struct ApiResponse: Codable {
    let status: String
    let data: DataContainer?
    let error: String?
}

struct DataContainer: Codable {
    let items: [MovimientoEntity]
}

struct MovimientoEntity: Identifiable, Codable {
    let id: Int
    let empleado: Int
    let nombramiento: String
    let tipoMovimiento: String
    let nombreMovimiento: String
    let fecha: Date
    let estatus: Int

    enum CodingKeys: String, CodingKey {
        case id
        case empleado
        case nombramiento
        case tipoMovimiento
        case nombreMovimiento
        case fecha
        case estatus
    }
}
