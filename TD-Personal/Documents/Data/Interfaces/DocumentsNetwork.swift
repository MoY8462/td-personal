//
//  DocumentsNetwork.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 23/05/25.
//

import Foundation

protocol  DocumentsNetwork {
    func execute(numeroEmpleado: String) async -> Result<DocumentsDTO, NSError>
}
