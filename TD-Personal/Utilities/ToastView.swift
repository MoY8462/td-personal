//
//  ToastView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 19/01/25.
//

import SwiftUI

struct ToastView: View {
    var message: String

    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .padding()
            .background(Color.black.opacity(0.8))
            .cornerRadius(10)
            .padding(.top, 50)
    }
}
