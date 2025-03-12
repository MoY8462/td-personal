//
//  StatusElementView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 30/01/25.
//

import Foundation
import SwiftUI

struct StatusElementView<Content: View>: View {
    let status: Status
    let titleState: String
    let fechaHoraActualizacion: String
    let contenidoTooltip: String
    let content: Content
    @State var showBottomInfo:Bool = false
    
    init(
        status: Status,
        titleState: String,
        fechaHoraActualizacion: String,
        contenidoTooltip: String,
        @ViewBuilder content: () -> Content
    ) {
        self.status = status
        self.titleState = titleState
        self.fechaHoraActualizacion = fechaHoraActualizacion
        self.contenidoTooltip = contenidoTooltip
        self.content = content()
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(spacing: 0) {
                CircleStatusView(status: status)
                self.content
            }

            VStack(alignment: .leading, spacing: 4) {

                Text(titleState)
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.black)
                Text(fechaHoraActualizacion)
                    .font(.system(size: 11, weight: .regular))
                    .foregroundColor(.gray)
            }
        }
        .onTapGesture {
            switch status {
            case .info, .success, .warning, .error:
                showBottomInfo.toggle()
            default:
                break
            }
            
        }
        .sheet(isPresented: $showBottomInfo, content: {
            InfoStatusSheetView(contentInfo: contenidoTooltip, status: status, showBottomInfo: $showBottomInfo)
                .presentationDetents([.fraction(0.3)])
        })
    }
}

struct CircleStatusView: View {
    let status: Status
    let width: CGFloat = 32
    let height: CGFloat = 32
    var body: some View {
        Circle()
            .frame(width: width, height: height)
            .foregroundColor(status.color)
            .overlay {
                Image(systemName: status.systemName)
                    .foregroundColor(.white)
            }
    }
}
