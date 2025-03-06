//
//  RealDataRepository.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 06/01/25.
//

import Foundation

class RealDataRepository: DataRepository {
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()

    func fetchData(for empleado: Int, completion: @escaping (Result<[MovimientoEntity], Error>) -> Void) {
        guard let url = URL(string: "https://api.example.com/movimientos") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let requestBody = ["empleado": empleado]
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(self.dateFormatter)
                let apiResponse = try decoder.decode(ApiResponse.self, from: data)
                if apiResponse.status == "success", let items = apiResponse.data?.items {
                    completion(.success(items))
                } else if let errorMessage = apiResponse.error {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: errorMessage])))
                } else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

class MockDataRepository: DataRepository {
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()

    func fetchData(for empleado: Int, completion: @escaping (Result<[MovimientoEntity], Error>) -> Void) {
        //MARK: Simulación de una respuesta exitosa con datos mock
        let mockData = [
            MovimientoEntity(id: 1, empleado: empleado, nombramiento: "Prórroga para ayudante de profesor de asignatura “A”", tipoMovimiento: "baja", nombreMovimiento: "Disminución Horas", fecha: dateFormatter.date(from: "2023-10-01T14:30:00")!, estatus: 2),
            MovimientoEntity(id: 2, empleado: empleado, nombramiento: "Prórroga para ayudante de profesor de asignatura “A”", tipoMovimiento: "alta", nombreMovimiento: "Prórroga", fecha: dateFormatter.date(from: "2023-10-01T14:30:00")!, estatus: 3),
            MovimientoEntity(id: 3, empleado: empleado, nombramiento: "Subgerente de Ventas", tipoMovimiento: "baja", nombreMovimiento: "Prórroga", fecha: dateFormatter.date(from: "2023-10-01T14:30:00")!, estatus: 1),
            MovimientoEntity(id: 4, empleado: empleado, nombramiento: "Subgerente de Ventas", tipoMovimiento: "alta", nombreMovimiento: "Prórroga", fecha: dateFormatter.date(from: "2023-10-01T14:30:00")!, estatus: 0)
        ]
        completion(.success(mockData))
        //MARK: Simulación de una respuesta vacía
//        let emptyData: [MovimientoEntity] = []
//        completion(.success(emptyData))
        //MARK: Simulación de falla del servicio
//        let error = NSError(domain: "com.example.TD-Personal", code: 1, userInfo: [NSLocalizedDescriptionKey: "Error al obtener los datos"])
//        completion(.failure(error))
    }
}
