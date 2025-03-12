//
//  DetailMovementViewModel.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 30/01/25.
//

import Foundation

class DetailMovementViewModel: ObservableObject {
    @Published var detailMovement: DetailMovementData?
    @Published var errorMessage: String?

    private let fetchDetailMovementUseCase: FetchDetailMovementUseCase

    init() {
        self.fetchDetailMovementUseCase = FetchDetailMovementUseCaseImpl(
            repository: DetailMovementRepositoryImpl(
                service: MockDetailMovementService()
            )
        )
    }

    func fetchDetailMovement(numeroEmpleado: String, idMovimiento: String) {
        fetchDetailMovementUseCase.execute(numeroEmpleado: numeroEmpleado, idMovimiento: idMovimiento) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let detailMovement):
                    self?.detailMovement = detailMovement
                case .failure(let error):
                    self?.errorMessage = "No se ecnontró información."
                }
            }
        }
    }
}
