//
//  HomeViewModel.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let fetchCarouselImagesUseCase: CarouselImagesUseCase
    @Published var items: [CarouselItem] = []
    @Published var errorMessage: String?

    // Inicializador por defecto
    init(fetchCarouselImagesUseCase: CarouselImagesUseCase = CarouselImagesUseCaseImpl(repository: CarouselMockDataSource())) {
        self.fetchCarouselImagesUseCase = fetchCarouselImagesUseCase
    }

    func fetchCarousel() {
        fetchCarouselImagesUseCase.execute { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let items):
                    DispatchQueue.main.async {
                        self?.items = items
                    }
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
