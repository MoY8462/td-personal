//
//  MiCuentaView.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 04/12/24.
//
import SwiftUI

struct MiCuentaView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Detalles de tu cuenta")
                    .font(.largeTitle)
                    .padding()
                HStack {
                    Text("Nombre:")
                    Spacer()
                    Text("Usuario")
                }
                .padding()
                HStack {
                    Text("Email:")
                    Spacer()
                    Text("usuario@example.com")
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Mi Cuenta")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
