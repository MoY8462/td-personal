//
//  NavBar.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 07/01/25.
//

import SwiftUI

struct NavBar: View {
    @EnvironmentObject var globalVariables: GlobalVariables
    @State private var showBottomSheet = false
    var title: NavbarSelected
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                if !title.iconName.isEmpty {
                    Image(systemName: title.iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.bluePrimary)
                        .frame(width: 24, height: 26)
                        .padding(.trailing, 8)
                }
                Text(title.description)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.bluePrimary)
                Spacer()
                if globalVariables.loginAuth {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.bluePrimary)
                        .frame(width: 24, height: 26)
                        .onTapGesture {
                            showBottomSheet.toggle()
                        }
                        .sheet(isPresented: $showBottomSheet) {
                            Notificaciones(showBottom: $showBottomSheet)
                        }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            Divider()
                .foregroundColor(.darkPrimary)
        }
        
    }
}

struct NavBarSecondary: View {
    @EnvironmentObject var globalVariables: GlobalVariables
    @EnvironmentObject var movementsRouter: MovementsRouter
    @EnvironmentObject var homeRouter: HomeRouter
    @State private var showBottomSheet = false
    var title: NavbarSelected
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Button(action: {
                    switch title {
                    case .home:
                        homeRouter.navigateBack()
                    case .movements:
                        movementsRouter.navigateBack()
                    default:
                        break
                    }
                }) {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.bluePrimary)
                        .frame(width: 24, height: 26)
                        .padding(.trailing, 8)
                }
                Text(title.description)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.bluePrimary)
                Spacer()
                if globalVariables.loginAuth {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.bluePrimary)
                        .frame(width: 24, height: 26)
                        .onTapGesture {
                            showBottomSheet.toggle()
                        }
                        .sheet(isPresented: $showBottomSheet) {
                            Notificaciones(showBottom: $showBottomSheet)
                        }
                }

            }
            .frame(maxWidth: .infinity)
            .padding()
            Divider()
                .foregroundColor(.darkPrimary)
        }
    }
}

struct NavBarHome: View {
    @EnvironmentObject var globalVariables: GlobalVariables
    @State private var showBottomSheet = false
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                if globalVariables.loginAuth {
                    Image("Profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                }
                Text(globalVariables.loginAuth ? "Hola Moisés" : "Hola")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.bluePrimary)
                Spacer()
                if globalVariables.loginAuth {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.bluePrimary)
                        .frame(width: 24, height: 26)
                        .onTapGesture {
                            showBottomSheet.toggle()
                        }
                        .sheet(isPresented: $showBottomSheet) {
                            Notificaciones(showBottom: $showBottomSheet)
                        }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            Divider()
                .foregroundColor(.darkPrimary)
        }
    }
}

enum NavbarSelected {
    case home
    case movements
    case documents
    case account
    case calendar
    
    var description: String {
        switch self {
        case .home:
            return ""
        case .movements:
            return "Movimientos"
        case .documents:
            return "Documentos"
        case .account:
            return "Mi cuenta"
        case .calendar:
            return "Calendario"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return ""
        case .movements:
            return "arrow.left.arrow.right"
        case .documents:
            return "folder.fill"
        case .account:
            return ""
        case .calendar:
            return "calendar"
        }
    }
}



enum NavigationOrigin {
    case home
    case movements
    case documents
    case account
}
