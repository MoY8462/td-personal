//
//  DetailMovementAPIClient.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 30/01/25.
//

import Foundation

protocol DetailMovementAPIClientProtocol {
    func request<T: Codable>(endpoint: String, completion: @escaping (Result<T, NSError>) -> Void)
}

class DetailMovementAPIClient: DetailMovementAPIClientProtocol {
    static let shared = DetailMovementAPIClient()

    func request<T: Codable>(endpoint: String, completion: @escaping (Result<T, NSError>) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(NSError()))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(NSError()))
            }
        }.resume()
    }
}
