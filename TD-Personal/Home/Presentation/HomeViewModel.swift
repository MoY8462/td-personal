//
//  HomeViewModel.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var items: [CarouselItemDTO] = []
    @Published var errorMessage: String?

    @MainActor
    func fetchCarousel() {
        Task {
            let carouselFactory = CarouselFactory.build()
            
            var result = await carouselFactory.execute()
            switch result {
            case .success(let dto):
                self.items = dto.data
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
