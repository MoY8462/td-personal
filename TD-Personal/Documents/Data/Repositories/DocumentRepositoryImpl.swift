//
//  DocumentRepositoryImpl.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 15/01/25.
//

import Foundation

class DocumentRepositoryImpl: DocumentRepository {
    private let service: DocumentService
    
    init(service: DocumentService) {
        self.service = service
    }
    
    func fetchDocuments(employeeNumber: String, completion: @escaping (Result<[Document], Error>) -> Void) {
        service.fetchDocuments(employeeNumber: employeeNumber) { result in
            switch result {
            case .success(let apiResponse):
                if let documentDTOs = apiResponse.data?.documents {
                    let documents = documentDTOs.map { Document(id: $0.id, name: $0.name, downloadURL: $0.downloadURL, documentType: $0.documentType) }
                    completion(.success(documents))
                } else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No documents found"])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
