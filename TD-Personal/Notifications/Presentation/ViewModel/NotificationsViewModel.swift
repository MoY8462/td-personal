//
//  NotificationsViewModel.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

class NotificationsViewModel: ObservableObject {
    private let notificationsUseCase: NotificationsUseCase
    @Published var items: [NotificationItem] = []
    @Published var errorMessage: String?

    // Inicializador por defecto
    init(notificationsUseCase: NotificationsUseCase = NotificationsUseCaseImpl(repository: NotificationsMockDataSource())) {
        self.notificationsUseCase = notificationsUseCase
    }

    func fetchCarousel(numeroEmpleado: String) {
        notificationsUseCase.execute(numeroEmpleado: numeroEmpleado) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let items):
                    DispatchQueue.main.async {
                        self?.items = items.data
                    }
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
