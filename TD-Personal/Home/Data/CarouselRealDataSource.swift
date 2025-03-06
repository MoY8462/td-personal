//
//  CarouselRealDataSource.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation

class CarouselRemoteDataSource: CarouselRepository {
    private let url = URL(string: "https://api.example.com/carousel")!

    func fetchCarouselImages(completion: @escaping (Result<EntityCarousel, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            do {
                let apiCarousel = try JSONDecoder().decode(EntityCarousel.self, from: data)
                completion(.success(apiCarousel))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
