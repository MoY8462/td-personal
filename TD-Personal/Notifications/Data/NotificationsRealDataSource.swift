//
//  NotificationsRealDataSource.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

class NotificationsRealDataSource: NotificationRepository {
    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func getNotificationData(numeroEmpleado: String, completion: @escaping (Result<NotificationEntity, Error>) -> Void) {
        let urlString = "https://api.example.com/employee?numeroEmpleado=\(numeroEmpleado)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        let task = urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }

            do {
                let employeeData = try JSONDecoder().decode(NotificationEntity.self, from: data)
                completion(.success(employeeData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
