//
//  MovimientosView.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 04/12/24.
//
import SwiftUI

struct MovimientosView: View {
    @StateObject var movimientosViewModel = MovimientosViewModel()
    @State private var empleado: String = "123456"
    var body: some View {
        VStack {
            NavBar(title: .movements)
            ScrollView {
                VStack {
                    if movimientosViewModel.errorMessage != nil {
                        MessageView(text: NSLocalizedString("text_error_cargar", comment: ""))
                    }
                    else if movimientosViewModel.data.isEmpty {
                        MessageView(text: NSLocalizedString("text_sin_movimientos", comment: ""))
                    }
                    else {
                        HStack {
                            Image(systemName: "arrow.up.circle.fill")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .foregroundColor(.bluePrimary)
                            Text("Altas")
                                .padding(.leading, 16)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.bluePrimary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                        Divider()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        
                        
                        ForEach(movimientosViewModel.data.filter { $0.tipoMovimiento == "alta" }) { item in
                            MovimientoItemView(item: item)
                        }
                        
                        HStack {
                            Image(systemName: "arrow.down.circle.fill")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .foregroundColor(.bluePrimary)
                            Text("Bajas")
                                .padding(.leading, 16)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.bluePrimary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                        Divider()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        
                        ForEach(movimientosViewModel.data.filter { $0.tipoMovimiento == "baja" }) { item in
                            MovimientoItemView(item: item)
                        }
                    }
                    
                }
                .padding(.vertical, 16)
                .onAppear{
                    if let empleadoInt = Int(empleado) {
                        movimientosViewModel.fetchData(for: empleadoInt)
                    }
                }
            }
        }
        
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

struct MovimientoItemView: View {
    let item: MovimientoEntity
    
    var body: some View {
        let estatus = MovimientoEstatus(rawValue: item.estatus) ?? .progreso
        
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(estatus.description)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(estatus.color)
                Image(systemName: estatus.iconName)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(estatus.color)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Nombramiento:")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.darkPrimary)
            Text(item.nombramiento)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.darkPrimary)
            Text("Tipo Movimiento:")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.darkPrimary)
            Text(item.nombreMovimiento)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.darkPrimary)
            Text("Fecha:")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.darkPrimary)
            Text(item.fecha, formatter: dateFormatter)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.darkPrimary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(estatus.color, lineWidth: 1)
        )
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

struct MessageView: View {
    let text: String
    
    var body: some View {
        VStack {
            Text(text)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.bluePrimary)
            Image(systemName: "chevron.left.forwardslash.chevron.right")
                .resizable()
                .frame(width: 35, height: 28)
                .foregroundColor(.darkPrimary)
            Spacer()
        }
    }
}

enum MovimientoEstatus: Int {
    case progreso = 0
    case pausado = 1
    case cancelado = 2
    case terminado = 3
    
    var description: String {
        switch self {
        case .progreso:
            return "Progreso"
        case .pausado:
            return "Pausado"
        case .cancelado:
            return "Cancelado"
        case .terminado:
            return "Terminado"
        }
    }
    
    var iconName: String {
        switch self {
        case .progreso:
            return "exclamationmark.circle"
        case .pausado:
            return "exclamationmark.triangle"
        case .cancelado:
            return "xmark.circle"
        case .terminado:
            return "checkmark.circle"
        }
    }
    
    var color: Color {
        switch self {
        case .progreso:
            return .bluePrimary
        case .pausado:
            return .yellowPrimary
        case .cancelado:
            return .redPrimary
        case .terminado:
            return .greenPrimary
        }
    }
}
