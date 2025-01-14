//
//  DocumentosView.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 04/12/24.
//
import SwiftUI

struct DocumentosView: View {
    @ObservedObject var documentsRouter = DocumentsRouter()
    var body: some View {
        NavigationStack(path: $documentsRouter.navPath) {
            VStack {
                NavBar(title: .documents)
                    .frame(maxWidth: .infinity)
                ScrollView {
                    MessageView(text: NSLocalizedString("text_sin_documentos", comment: ""))
                        .padding(.top, 32)
                }
            }
            .frame(maxWidth: .infinity)
            .navigationDestination(for: DocumentsRouter.Destination.self) { destination in
                    switch destination {
                    case .movementDetail: MovementDetailView(navigationOrigin: .home)
                    
                    }
                }
        }
        .environmentObject(documentsRouter)
    }
}
