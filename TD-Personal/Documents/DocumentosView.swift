//
//  DocumentosView.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 04/12/24.
//
import SwiftUI

struct DocumentosView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Aquí están tus documentos")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "doc.text.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
                Spacer()
            }
            .toolbar {
                NavBar(title: .documents)
                    .frame(maxWidth: .infinity)
                
            }.frame(maxWidth: .infinity)
        }
    }
}
