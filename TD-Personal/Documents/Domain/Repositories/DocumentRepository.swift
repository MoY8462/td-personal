//
//  DocumentRepository.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 15/01/25.
//

import Foundation

protocol DocumentRepository {
    func fetchDocuments(employeeNumber: String, completion: @escaping (Result<[Document], Error>) -> Void)
}
