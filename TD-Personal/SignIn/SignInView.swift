//
//  SignInView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 16/02/25.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var myAccountRouter: MyAccountRouter
    @EnvironmentObject var globalVariables: GlobalVariables
    @State var email: String = ""
    @State var password: String = ""
    @State var emailError: Bool = false
    @State var passwordError: Bool = false
    var navigationOrigin: NavigationOrigin
    var body: some View {
        ScrollView {
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
                    inputText: $email,
                    errorField: $emailError
                )
                InputFieldView(
                    title: "Contraseña:",
                    placeHolder: "●●●●●●●●●●●",
                    inputText: $password,
                    errorField: $passwordError
                )
                Text("¿Olvidaste tu contraseña?")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.bluePrimary)
                    .padding(.vertical, 16)
                HStack(spacing: 8) {
                    Text("¿No tienes cuenta?")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.bluePrimary)
                        .padding(.vertical, 16)
                    Text("Registrate aquí")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.bluePrimary)
                        .padding(.vertical, 16)
                        .underline()
                        .onTapGesture {
                            myAccountRouter.navigate(to: .signup)
                        }
                }
                PrimaryButtonView(textButton: "Iniciar sesión", action: {
                    logingUser(email: email, password: password)
                })
                Spacer()
                Image("fi_unam")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 60)
                    .padding(.bottom, 20)
            }
        }
        
        .navigationBarHidden(true)
    }
    
    func logingUser(email: String, password: String) {
        if email == "prueba@dominio.com" && password == "Prueba123" {
            globalVariables.loginAuth = true
            myAccountRouter.navigateToRoot()
        } else {
            emailError = true
            passwordError = true
        }
        
        
    }
}

#Preview {
//    SignInView()
}
