//
//  MovimientoViewModel.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 06/01/25.
//

import Foundation
import Combine

class MovimientosViewModel: ObservableObject {
    @Published var data: [MovimientoEntity] = []
    @Published var errorMessage: String?
    //private static var repository: DataRepository = RealDataRepository()
    private static var repository: DataRepository = MockDataRepository()
    private var cancellables = Set<AnyCancellable>()

    func fetchData(for empleado: Int) {
        MovimientosViewModel.repository.fetchData(for: empleado) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.data = data
                    self?.errorMessage = nil
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
