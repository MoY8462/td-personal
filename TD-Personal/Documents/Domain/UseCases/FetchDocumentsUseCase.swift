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
    
    func execute(employeeNumber: String, completion: @escaping (Result<[Document], Error>) -> Void) {
        repository.fetchDocuments(employeeNumber: employeeNumber, completion: completion)
    }
}
