//
//  SignUpView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 16/02/25.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var myAccountRouter: MyAccountRouter
    @State var name: String = ""
    @State var email: String = ""
    @State var rfc: String = ""
    @State var telephone: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var nameError: Bool = false
    @State var emailError: Bool = false
    @State var rfcError: Bool = false
    @State var telephoneError: Bool = false
    @State var passwordError: Bool = false
    @State var confirmPasswordError: Bool = false
    var navigationOrigin: NavigationOrigin
    var body: some View {
        VStack {
            ScrollView{
                Image("se_gen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 85)
                    .padding(.top, 40)
                Text("Registro")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.bluePrimary)
                    .padding(.vertical, 32)
                InputFieldView(
                    title: "Nombre",
                    placeHolder: "Pedro Dominguez",
                    inputText: $name,
                    errorField: $nameError
                )
                InputFieldView(
                    title: "Correo electrónico",
                    placeHolder: "example@dominio.com",
                    inputText: $email,
                    errorField: $emailError
                )
                InputFieldView(
                    title: "RFC con homoclave",
                    placeHolder: "PDRS224500789",
                    inputText: $rfc,
                    errorField: $rfcError
                )
                InputFieldView(
                    title: "Número de teléfono",
                    placeHolder: "55 8489 89450",
                    inputText: $telephone,
                    errorField: $telephoneError
                )
                InputFieldView(
                    title: "Contraseña",
                    placeHolder: "●●●●●●●●●●●",
                    inputText: $password,
                    errorField: $passwordError
                )
                InputFieldView(
                    title: "Confirmar contraseña",
                    placeHolder: "●●●●●●●●●●●",
                    inputText: $confirmPassword,
                    errorField: $confirmPasswordError
                )
                HStack(spacing: 8) {
                    Text("¿Ya tienes cuenta?")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.bluePrimary)
                        .padding(.vertical, 16)
                    Text("Iniciar sesión")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.bluePrimary)
                        .padding(.vertical, 16)
                        .underline()
                        .onTapGesture {
                            myAccountRouter.navigate(to: .login)
                        }
                }
                
                PrimaryButtonView(textButton: "Crear cuenta", action: {})
                Image("fi_unam")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 60)
                    .padding(.vertical, 20)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
//    SignUpView()
}
