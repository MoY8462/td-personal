//
//  CalendarRouter.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 13/01/25.
//

import Foundation
import SwiftUI

final class CalendarRouter: ObservableObject  {
    public enum Destination: Codable, Hashable {
        case movementDetail
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
