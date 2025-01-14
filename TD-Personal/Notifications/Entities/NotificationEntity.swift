//
//  NotificationEntity.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

struct NotificationEntity: Codable {
    let status: String
    let data: [NotificationItem]
    let error: String?
}

struct NotificationItem: Codable {
    let title: String
    let content: String
    let fecha: String
    let id: Int
}
