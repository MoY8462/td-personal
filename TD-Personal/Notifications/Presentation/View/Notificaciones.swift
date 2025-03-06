//
//  Notificaciones.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 07/01/25.
//

import SwiftUI

struct Notificaciones: View {
    @StateObject var notificationsViewModel = NotificationsViewModel()
    @Binding var showBottom: Bool
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image(systemName: "bell.fill")
                    .resizable()
                    .foregroundColor(.bluePrimary)
                    .frame(width: 24, height: 26)
                    .padding(.trailing)
                Text("Notificaciones")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.bluePrimary)
                
                Spacer()
                Button(action: {
                    showBottom.toggle()
                }){
                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(.darkPrimary)
                        .frame(width: 18, height: 18)
                }
                
                
            }
            .padding(.vertical, 32)
            .padding(.horizontal, 20)
            
            ScrollView {
                VStack(spacing: 10) {
                    if notificationsViewModel.items.isEmpty {
                        MessageView(text: NSLocalizedString("text_sin_notificacioness", comment: ""))
                            .padding(.top, 32)
                    }
                    ForEach(notificationsViewModel.items, id: \.id) { notification in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(notification.title)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.bluePrimary)
                            Text(notification.content)
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.bluePrimary)
                            Text(notification.fecha)
                                .font(.system(size: 10, weight: .regular))
                                .foregroundColor(.darkPrimary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(4)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing, .bottom], 16)
                .onAppear{
                    notificationsViewModel.fetchCarousel(numeroEmpleado: "123456")
                }
            }
        }
    }
}
