//
//  DocumentDTO.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 15/01/25.
//

import Foundation

import Foundation

enum DocumentType: Int, Codable {
    case pdf = 1
    case excel = 2
    case word = 3
    
    var imageName: String {
        switch self {
        case .pdf:
            return "pdf_icon"
        case .excel:
            return "excel_icon"
        case .word:
            return "word_icon"
        }
    }
    
    var extensionName: String {
        switch self {
        case .pdf:
            return ".pdf"
        case .excel:
            return ".xlsx"
        case .word:
            return ".doc"
        }
    }
}

struct Document: Codable {
    let id: String
    let name: String
    let downloadURL: String
    let documentType: DocumentType
    let fecha: String
}

struct Datum: Codable {
    var id: UUID = UUID()
    let nombramiento: String
    let documentos: [Document]
}

struct DocumentResponse: Codable {
    let status: String
    let data: [Datum]
    let error: String?
}
