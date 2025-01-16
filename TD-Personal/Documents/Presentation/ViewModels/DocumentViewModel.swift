//
//  DocumentViewModel.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 15/01/25.
//

import Foundation

class DocumentViewModel: ObservableObject {
    @Published var documents: [Document] = []
    @Published var isLoading = true
    @Published var errorMessage: String?
    
    private let fetchDocumentsUseCase: FetchDocumentsUseCase
    
    // Inicializador por defecto
    init(fetchDocumentsUseCase: FetchDocumentsUseCase = FetchDocumentsUseCase(repository: DocumentRepositoryImpl(service: MockDocumentService()) )) {
        self.fetchDocumentsUseCase = fetchDocumentsUseCase
    }


    
    func fetchDocuments(employeeNumber: String) {
        isLoading = true
        fetchDocumentsUseCase.execute(employeeNumber: employeeNumber) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let documents):
                    self?.documents = documents
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
