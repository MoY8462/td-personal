//
//  HomeNavigation.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation
import SwiftUI

final class HomeRouter: ObservableObject  {
    public enum Destination: Codable, Hashable {
        case movementDetail
    }
    
    @Published var navPath = NavigationPath()
    
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)    
    }
}
