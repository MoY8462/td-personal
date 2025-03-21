//
//  InputFieldView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 16/02/25.
//

import SwiftUI

struct InputFieldView: View {
    var title: String
    var placeHolder: String
    @Binding var inputText: String
    @Binding var errorField: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(errorField ? .redPrimary : .bluePrimary)
            TextField(placeHolder, text: $inputText)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.bluePrimary)
                .padding(.bottom, 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(errorField ? .redPrimary : .bluePrimary),
            alignment: .bottom
        )
        .padding()
    }
}

enum typeFieldText {
    case text
    case number
    case password
    case phone
    
}

#Preview {
    @Previewable @State var title:String = "Título"
    @Previewable @State var inputText:String = ""
    @Previewable @State var inputTextError:Bool = false
    InputFieldView(
        title: title,
        placeHolder: title,
        inputText: $inputText,
        errorField: $inputTextError
    )
}
