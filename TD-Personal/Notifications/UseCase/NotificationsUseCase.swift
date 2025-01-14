//
//  NotificationsUseCase.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

protocol NotificationsUseCase {
    func execute(numeroEmpleado: String, completion: @escaping (Result<NotificationEntity, Error>) -> Void)
}