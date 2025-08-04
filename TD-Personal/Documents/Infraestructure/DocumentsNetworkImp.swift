//
//  DocumentsNetworkImp.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 23/05/25.
//

import Foundation

class DocumentsNetworkImp: DocumentsNetwork {
    func execute(numeroEmpleado: String) async -> Result<DocumentsDTO, NSError> {
        let url = URL(string: URLs.listDocuments.rawValue)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: String] = ["numeroEmpleado": numeroEmpleado]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
            let (data, _) = try await URLSession.shared.data(for: request)
            let dto = try JSONDecoder().decode(DocumentsDTO.self, from: data)
            return .success(dto)
        } catch {
            return .failure(error as NSError)
        }
    }
}
