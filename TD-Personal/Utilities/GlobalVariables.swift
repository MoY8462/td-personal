//
//  GlobalVariables.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 06/03/25.
//

import Foundation


final class GlobalVariables: ObservableObject {
    @Published var loginAuth: Bool = false
    @Published var currentTab: Tab = .home
}

enum Tab: String, CaseIterable {
    case home
    case movements
    case calendar
    case documents
    case profile

    var tabName: String {
        switch self {
        case .home:
            return "Inicio"
        case .movements:
            return "Movimientos"
        case .calendar:
            return "Calendario"
        case .documents:
            return "Documentos"
        case .profile:
            return "Mi cuenta"
        }
    }
}
