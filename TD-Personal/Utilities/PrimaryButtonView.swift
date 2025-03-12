//
//  PrimaryButtonView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 21/02/25.
//

import SwiftUI

struct PrimaryButtonView: View {
    var textButton: String
    var action: () -> Void

    var body: some View {
        Button(action:{
            action()
        },
        label: {
            Text(textButton)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
        })
        .buttonStyle(.borderedProminent)
        .tint(.bluePrimary)
        
    }
}

#Preview {
    @Previewable @State var title:String = "Iniciar sesión"
    PrimaryButtonView(textButton: title, action: {
        
    })
}
