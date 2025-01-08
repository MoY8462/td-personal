//
//  Notificaciones.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 07/01/25.
//

import SwiftUI

struct Notificaciones: View {
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image(systemName: "bell.fill")
                    .resizable()
                    .foregroundColor(.bluePrimary)
                    .frame(width: 20, height: 20)
                Text("Notificaciones")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.bluePrimary)
                
                Spacer()
                Image(systemName: "xmark")
                    .resizable()
                    .foregroundColor(.darkPrimary)
                    .frame(width: 16, height: 16)
                
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            
            Divider()
                .foregroundColor(.darkPrimary)
                .padding(.horizontal)
            ScrollView {
                VStack {
                    
                }
                .padding()
            }
        }
    }
}
