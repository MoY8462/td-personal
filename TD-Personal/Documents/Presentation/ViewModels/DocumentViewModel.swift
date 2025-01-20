//
//  DocumentViewModel.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 15/01/25.
//

import Foundation
import Combine

class DocumentViewModel: ObservableObject {
    @Published var documents: [Datum] = []
    private var fetchDocumentsUseCase: FetchDocumentsUseCase

    init(fetchDocumentsUseCase: FetchDocumentsUseCase = FetchDocumentsUseCase(repository: MockDocumentRepository())) {
        self.fetchDocumentsUseCase = fetchDocumentsUseCase
        fetchDocuments(numeroEmpleado: "12345")
    }

    func fetchDocuments(numeroEmpleado: String) {
        fetchDocumentsUseCase.execute(numeroEmpleado: numeroEmpleado) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.documents = response.data
                case .failure(let error):
                    print("Error fetching documents: \(error)")
                }
            }
        }
    }
}
