//
//  SignInView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 16/02/25.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("se_gen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 85)
                    .padding(.top, 40)
                Text("Iniciar sesión")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.bluePrimary)
                    .padding(.vertical, 32)
                InputFieldView(
                    title: "Correo electrónico:",
                    placeHolder: "example@dominio.com",
                    inputText: $email
                )
                InputFieldView(
                    title: "Contraseña:",
                    placeHolder: "●●●●●●●●●●●",
                    inputText: $password
                )
                Text("¿Olvidaste tu contraseña?")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.bluePrimary)
                    .padding(.vertical, 16)
                PrimaryButtonView(textButton: "Iniciar sesión", action: {})
                Spacer()
                Image("fi_unam")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 60)
                    .padding(.bottom, 20)
                
                
            }
        }
        
    }
}

#Preview {
    SignInView()
}
