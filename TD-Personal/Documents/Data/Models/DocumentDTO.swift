//
//  DocumentDTO.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 15/01/25.
//

import Foundation

struct DocumentDTO: Codable {
    let id: String
    let name: String
    let downloadURL: String
    let documentType: Int
}

struct DocumentResponse: Codable {
    let status: String
    let data: DocumentList?
    let error: String?
}

struct DocumentList: Codable {
    let documents: [DocumentDTO]
}
