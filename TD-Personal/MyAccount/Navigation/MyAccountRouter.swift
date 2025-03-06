//
//  MyAccountRouter.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 06/03/25.
//

import Foundation
import SwiftUI

final class MyAccountRouter: ObservableObject  {
    public enum Destination: Codable, Hashable {
        case login
        case signup
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
