//
//  DetailMovementEntity.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 30/01/25.
//

import Foundation
import SwiftUI

struct DetailMovementResponse: Codable {
    let status: String
    let data: DetailMovementData?
    let error: String?
}

struct DetailMovementData: Codable {
    let id: Int
    let nombramiento: String
    let fecha: String
    let status: [DetailMovementStatus]
}

struct DetailMovementStatus: Codable {
    let id: Int
    let state: Status
    let nombreMovimiento: String
    let fecha: String
    let contenido: String

    enum CodingKeys: String, CodingKey {
        case id, state, nombreMovimiento, fecha, contenido
    }

    init(id: Int, state: Status, nombreMovimiento: String, fecha: String, contenido: String) {
        self.id = id
        self.state = state
        self.nombreMovimiento = nombreMovimiento
        self.fecha = fecha
        self.contenido = contenido
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        let stateString = try container.decode(String.self, forKey: .state)
        state = Status(rawValue: stateString) ?? .empty
        nombreMovimiento = try container.decode(String.self, forKey: .nombreMovimiento)
        fecha = try container.decode(String.self, forKey: .fecha)
        contenido = try container.decode(String.self, forKey: .contenido)
    }
}

enum Status: String, Codable {
    case empty
    case success
    case last
    case warning
    case error
    case info

    var systemName: String {
        switch self {
        case .empty:
            return "circle.fill"
        case .success:
            return "checkmark"
        case .warning:
            return "exclamationmark.triangle"
        case .error:
            return "xmark"
        case .info:
            return "info"
        case .last:
            return ""
        }
    }
    
    var nameStatus: String {
        switch self {
        case .empty:
            return "En proceso"
        case .success:
            return "Finalizado"
        case .warning:
            return "Pausado"
        case .error:
            return "Cancelado"
        case .info:
            return "En proceso"
        case .last:
            return "Finalizado"
        }
    }

    var color: Color {
        switch self {
        case .empty:
            return .ligthGrayPrimary
        case .success:
            return .greenPrimary
        case .warning:
            return .yellowPrimary
        case .error:
            return .redPrimary
        case .info:
            return .bluePrimary
        case .last:
            return .bluePrimary
        }
    }
}
