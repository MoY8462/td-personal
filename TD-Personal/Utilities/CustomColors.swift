//
//  CustomColors.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 06/01/25.
//

import SwiftUI

extension Color {
    public static func custom(red: Double, green: Double, blue: Double) -> Color {
        return Color(red: red/255, green: green/255, blue: blue/255, opacity: 1.0)
    }

    public static func custom(red: Double, green: Double, blue: Double, opacity: Double) -> Color {
        return Color(red: red/255, green: green/255, blue: blue/255, opacity: opacity)
    }
    //MARK: Colores con manejo de opacidad
    static let bluePrimary = Color.custom(red: 55, green: 63, blue: 81, opacity: 1)
    static let darkPrimary = Color.custom(red: 115, green: 115, blue: 115, opacity: 1)
    static let ligthGrayPrimary = Color.custom(red: 163, green: 163, blue: 163, opacity: 1)
    static let redPrimary = Color.custom(red: 206, green: 43, blue: 51, opacity: 1)
    static let yellowPrimary = Color.custom(red: 250, green: 204, blue: 21, opacity: 1)
    static let greenPrimary = Color.custom(red: 101, green: 163, blue: 13, opacity: 1)
    //MARK: Colores sin manejo de opacidad
//    static let thakyouPageTitle = Color.custom(red: 0, green: 159, blue: 3)
}
