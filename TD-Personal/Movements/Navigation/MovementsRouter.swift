//
//  MovementsRouter.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation
import SwiftUI

class MovementsRouter: ObservableObject  {
    enum Destination: Hashable {
        static func == (lhs: MovementsRouter.Destination, rhs: MovementsRouter.Destination) -> Bool {
            return ObjectIdentifier(MovementsRouter.Destination.self) == ObjectIdentifier(MovementsRouter.Destination.self)
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(MovementsRouter.Destination.self))
        }

        
        case movementDetail(detailMovementEntity: DetailMovementEntity)
    }
    
    @Published var navPath = NavigationPath()
    
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
        print("MASV --  \(navPath.count)")
    }
    
    func navigateBack() {
         if !navPath.isEmpty {
             navPath.removeLast()
         }
     }
    
    func navigateToRoot() {
        print("MASV --  \(navPath.count)")
        navPath.removeLast(navPath.count)
    }
}
