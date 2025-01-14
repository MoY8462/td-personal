//
//  NotificationsMockDataSource.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

class NotificationsMockDataSource: NotificationRepository {
    func getNotificationData(numeroEmpleado: String, completion: @escaping (Result<NotificationEntity, Error>) -> Void) {
        let mockData = NotificationEntity(
            status: "success",
            data: [
                NotificationItem(title: "Título del primer elemento", content: "Contenido del primer elemento", fecha: "2023-10-01", id: 1),
                NotificationItem(title: "Título del segundo elemento", content: "Contenido del segundo elemento", fecha: "2023-10-02", id: 2)
            ],
            error: nil
        )
        completion(.success(mockData))
    }
}
