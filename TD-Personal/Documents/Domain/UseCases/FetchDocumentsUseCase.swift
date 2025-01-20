//
//  FetchDocumentsUseCase.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 15/01/25.
//

import Foundation

class FetchDocumentsUseCase {
    private let repository: DocumentRepository

    init(repository: DocumentRepository) {
        self.repository = repository
    }

    func execute(numeroEmpleado: String, completion: @escaping (Result<DocumentResponse, Error>) -> Void) {
        repository.fetchDocuments(numeroEmpleado: numeroEmpleado, completion: completion)
    }
}
