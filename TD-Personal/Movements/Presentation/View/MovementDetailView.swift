//
//  MovementDetailView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation
import SwiftUI

struct MovementDetailView: View {
    @StateObject var detallesMovimientosViewModel = DetailMovementViewModel()
    var navigationOrigin: NavigationOrigin
    var detailMovementEntity: DetailMovementEntity
    
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
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        if let detailMovement = detallesMovimientosViewModel.detailMovement {
                            Text("\(detailMovement.nombramiento)")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.bluePrimary)
                                .padding(.vertical,16)
                            Text("Fecha: \(detailMovement.fecha)")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.ligthGrayPrimary)
                                .padding(.bottom)
                            Divider()
                                .padding(.bottom, 16)
                            VStack(alignment: .leading, spacing: 0) {
                                ForEach(Array(detailMovement.status.enumerated()), id: \.element.id)  {
                                    index,
                                    status in
                                    StatusElementView(
                                        status: status.state,
                                        titleState: status.nombreMovimiento,
                                        fechaHoraActualizacion: status.fecha,
                                        contenidoTooltip: status.contenido
                                    ) {
                                        if  index == detailMovement.status.count - 1 {
                                            EmptyView()
                                        } else {
                                            Rectangle()
                                                .frame(width: 2, height: 54)
                                                .foregroundColor(status.state.color)
                                        }
                                    }
                                    
                                }
                            }
                            .padding()
                        } else {
                            MessageView(text: NSLocalizedString("text_error_cargar", comment: ""))
                                .padding(.top, 32)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .onAppear{
                detallesMovimientosViewModel.fetchDetailMovement(numeroEmpleado:  detailMovementEntity.getNumeroEmpleado(), idMovimiento: detailMovementEntity.getIdMovimiento())
            }
            
        }
        .navigationBarHidden(true)
        
    }
}

class DetailMovementEntity {
    private var numeroEmpleado: String
    private var idMovimiento: String
    
    init(numeroEmpleado: String, idMovimiento: String) {
        self.numeroEmpleado = numeroEmpleado
        self.idMovimiento = idMovimiento
    }
    
    func getNumeroEmpleado() -> String {
        return numeroEmpleado
    }
    
    func getIdMovimiento() -> String {
        return idMovimiento
    }
    
    func setNumeroEmpleado(numeroEmpleado: String) {
        self.numeroEmpleado = numeroEmpleado
    }
    
    func setIdMovimiento(idMovimiento: String) {
        self.idMovimiento = idMovimiento
    }
}
