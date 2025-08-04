//
//  DocumentsDataSource.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 23/05/25.
//

import Foundation


protocol DocumentsDataSource {
        func execute(numeroEmpleado: String) async -> Result<DocumentsDTO, NSError>
}
