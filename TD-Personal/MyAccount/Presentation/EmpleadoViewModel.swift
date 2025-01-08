//
//  EmpleadoViewModel.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 07/01/25.
//

import Foundation

class EmpleadoViewModel: ObservableObject {
    private let fetchEmpleadoUseCase: FetchEmpleadoUseCase

    @Published var empleado: Empleado?
    @Published var errorMessage: String?

    // Inicializador por defecto
    init(fetchEmpleadoUseCase: FetchEmpleadoUseCase = FetchEmpleadoUseCaseImpl(empleadoRepository: MockEmpleadoRepository())) {
        self.fetchEmpleadoUseCase = fetchEmpleadoUseCase
    }

    func fetchEmpleado(numeroEmpleado: Int) {
        fetchEmpleadoUseCase.execute(numeroEmpleado: numeroEmpleado) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let empleado):
                    self?.empleado = empleado
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
