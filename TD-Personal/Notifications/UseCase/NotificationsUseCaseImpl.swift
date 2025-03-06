//
//  NotificationsUseCaseImpl.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

class NotificationsUseCaseImpl: NotificationsUseCase {
    private let repository: NotificationRepository

    init(repository: NotificationRepository) {
        self.repository = repository
    }

    func execute(numeroEmpleado: String, completion: @escaping (Result<NotificationEntity, Error>) -> Void) {
        repository.getNotificationData(numeroEmpleado: numeroEmpleado, completion: completion)
    }
}
