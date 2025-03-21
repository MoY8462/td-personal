//
//  MiCuentaView.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 04/12/24.
//
import SwiftUI

struct MiCuentaView: View {
    @EnvironmentObject var myAccountRouter: MyAccountRouter
    @EnvironmentObject var globalVariables: GlobalVariables
    @StateObject var empleadoViewModel = EmpleadoViewModel()

    var body: some View {
        NavigationStack(path: $myAccountRouter.navPath) {
            VStack {
                NavBar(title: .account)
                ScrollView {
                    if let empleado = empleadoViewModel.empleado {
                        VStack(alignment: .center){
                            if let imageData = Data(base64Encoded: empleado.imagen.split(separator: ",").last.map(String.init) ?? ""),
                               let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120, height: 120)
                                    .padding(.vertical, 12)
                            }
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Datos de contacto")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.bluePrimary)
                            VStack(spacing: 12) {
                                VStack(alignment: .leading) {
                                    Text("Nombre:")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.darkPrimary)
                                    Text(empleado.nombre)
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.bluePrimary)
                                        .padding(.vertical, 4)
                                    Divider()
                                        .foregroundColor(.darkPrimary)
                                }
                                VStack(alignment: .leading) {
                                    Text("RFC:")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.darkPrimary)
                                    Text(empleado.rfc)
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.bluePrimary)
                                        .padding(.vertical, 4)
                                    Divider()
                                        .foregroundColor(.darkPrimary)
                                }
                                VStack(alignment: .leading) {
                                    Text("Teléfono:")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.darkPrimary)
                                    Text(empleado.telefono)
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.bluePrimary)
                                        .padding(.vertical, 4)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Divider()
                                        .foregroundColor(.darkPrimary)
                                }
                                VStack(alignment: .leading) {
                                    Text("Correo:")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.darkPrimary)
                                    Text(empleado.correo)
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.bluePrimary)
                                        .padding(.vertical, 4)
                                    Divider()
                                        .foregroundColor(.darkPrimary)
                                        
                                }
                            }
                            .padding(.horizontal, 8)
                        }
                        .padding()
                        HStack(spacing: 12) {
                            Text("Salir")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.darkPrimary)
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.bluePrimary)
                                .frame(width: 24, height: 26)
                        }
                        .padding(.top, 32)
                        .onTapGesture {
                            globalVariables.loginAuth = false
                        }
                        
                    } else if let errorMessage = empleadoViewModel.errorMessage {
                        MessageView(text: NSLocalizedString("text_error_cargar", comment: ""))
                    }
                }
            }
            .onChange(of: globalVariables.loginAuth) { _ in
                if globalVariables.loginAuth {
                    empleadoViewModel.fetchEmpleado(numeroEmpleado: 12345)
                }
                else {
                    myAccountRouter.navigate(to: .login)
                }
            }
            .onAppear {
                if globalVariables.loginAuth {
                    empleadoViewModel.fetchEmpleado(numeroEmpleado: 12345)
                }
                else {
                    myAccountRouter.navigate(to: .login)
                }
            }
            .navigationDestination(for: MyAccountRouter.Destination.self) { destination in
                    switch destination {
                    case .login: SignInView(
                        navigationOrigin: .account
                    )
                    case .signup: SignUpView(
                        navigationOrigin: .account
                    )
                    case .recovery: RecoveryPasswordView(
                        navigationOrigin: .account
                    )
                    }
                }
        }
        .environmentObject(myAccountRouter)

    }
}
