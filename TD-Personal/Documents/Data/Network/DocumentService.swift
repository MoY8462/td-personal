//
//  DocumentService.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 15/01/25.
//

import Foundation

class DocumentService {
    static let shared = DocumentService()
    
    private init() {}
    
    func fetchDocuments(employeeNumber: String, completion: @escaping (Result<DocumentResponse, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: "https://example.com/documents") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        urlComponents.queryItems = [URLQueryItem(name: "numeroEmpleado", value: employeeNumber)]
        
        guard let url = urlComponents.url else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(DocumentResponse.self, from: data)
                completion(.success(apiResponse))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
