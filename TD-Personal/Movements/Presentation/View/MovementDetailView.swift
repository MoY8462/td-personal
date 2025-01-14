//
//  MovementDetailView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation
import SwiftUI

struct MovementDetailView: View {
    var navigationOrigin: NavigationOrigin
    
    var body: some View {
        VStack {
            switch navigationOrigin {
            case .home:
                NavBarSecondary(title: .home)
            case .movements:
                NavBarSecondary(title: .movements)
            default:
                NavBarSecondary(title: .documents)
            }
            ScrollView {
                Text("Hola mundo")
                Text("Características")
            }
            
        }
        .navigationBarHidden(true)
        
    }
}
