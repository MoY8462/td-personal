//
//  MockDocumentService.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 15/01/25.
//

import Foundation

class DocumentsNetworkMock: DocumentsNetwork {
    func execute(numeroEmpleado: String) async -> Result<DocumentsDTO, NSError> {
        var shouldReturnError = false
        
        if shouldReturnError {
            let error = NSError(domain: "CarouselNetworkingMock", code: 1, userInfo: [NSLocalizedDescriptionKey: "Mock error"])
            return .failure(error)
        } else {
            let mockResponse = DocumentsDTO(
                status: "success",
                data: [
                    Datum(
                        nombramiento: "Ayudante de profesor de asignatura “A”",
                        documentos: [
                            Document(id: "123", name: "Document 1", downloadURL: "http://example.com/document1", documentType: .pdf, fecha: "13-01-2025"),
                            Document(id: "456", name: "Document 2", downloadURL: "http://example.com/document2", documentType: .excel, fecha: "01-01-2025"),
                            Document(id: "458", name: "Document 3", downloadURL: "http://example.com/document2", documentType: .word, fecha: "10-01-2025")
                        ]
                    )
                ],
                error: nil
            )
            return .success(mockResponse)
        }
    }
}
