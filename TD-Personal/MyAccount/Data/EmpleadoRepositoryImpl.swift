//
//  EmpleadoRepositoryImpl.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 07/01/25.
//

import Foundation

class EmpleadoRepositoryImpl: EmpleadoRepository {
    func fetchEmpleado(numeroEmpleado: Int, completion: @escaping (Result<Empleado, Error>) -> Void) {
        let urlString = "https://api.example.com/empleado/\(numeroEmpleado)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "URL inválida"])))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Datos no recibidos"])))
                return
            }

            do {
                let empleado = try JSONDecoder().decode(Empleado.self, from: data)
                completion(.success(empleado))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
