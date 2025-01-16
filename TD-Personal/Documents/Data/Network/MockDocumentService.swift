//
//  MockDocumentService.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 15/01/25.
//

import Foundation

class MockDocumentService: DocumentService {
    override func fetchDocuments(employeeNumber: String, completion: @escaping (Result<DocumentResponse, Error>) -> Void) {
        let mockDocuments = [
            DocumentDTO(id: "1", name: "Mock Document 1", downloadURL: "https://example.com/documents/1", documentType: 1),
            DocumentDTO(id: "2", name: "Mock Document 2", downloadURL: "https://example.com/documents/2", documentType: 2),
            DocumentDTO(id: "3", name: "Mock Document 3", downloadURL: "https://example.com/documents/3", documentType: 3)
        ]
        
        let mockDataContainer = DocumentList(documents: mockDocuments)
        let mockApiResponse = DocumentResponse(status: "success", data: mockDataContainer, error: nil)
        
        completion(.success(mockApiResponse))
    }
}
