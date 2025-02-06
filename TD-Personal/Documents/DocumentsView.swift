//
//  DocumentsView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 16/01/25.
//

import SwiftUI

struct DocumentosView: View {
    @ObservedObject var documentsRouter = DocumentsRouter()
    @StateObject var documentsViewModel = DocumentViewModel()
    @State var showToast: Bool = false
    @State var messageToast: String = ""
    
    var body: some View {
        NavigationStack(path: $documentsRouter.navPath) {
            ZStack {
                if showToast {
                    ToastView(message: messageToast)
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 0.5))
                }
                VStack {
                    NavBar(title: .documents)
                        .frame(maxWidth: .infinity)
                    ScrollView {
                        if documentsViewModel.documents.isEmpty {
                            MessageView(text: NSLocalizedString("text_sin_documentos", comment: ""))
                                .padding(.top, 32)
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(documentsViewModel.documents, id: \.id) { document in
                                VStack(alignment: .leading, spacing: 16) {
                                    Text(document.nombramiento)
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(.bluePrimary)
                                    ForEach(document.documentos, id: \.id){ element in
                                        HStack(spacing: 8) {
                                            Image(element.documentType.imageName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 35, height: 35)
                                            VStack(alignment: .leading) {
                                                Text("\(element.name)\(element.documentType.extensionName)")
                                                    .font(.system(size: 16, weight: .semibold))
                                                    .foregroundColor(.bluePrimary)
                                                Text("Última modificación: \(element.fecha)")
                                                    .font(.system(size: 12, weight: .regular))
                                                    .foregroundColor(.bluePrimary)
                                            }
                                            Spacer()
                                            Image(systemName: "icloud.and.arrow.down.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .foregroundColor(.bluePrimary)
                                                .frame(width: 21, height: 17)
                                                .onTapGesture {
                                                    messageToast = "Descargando..."
                                                    showToast = true
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                        showToast = false
                                                    }
                                                }
                                                .padding(.trailing, 16)
                                            
                                            
                                            
    //                                        Text(element.downloadURL)
    //                                            .font(.subheadline)
                                            
                                        
                                        }
                                        .padding(.top, 8)
                                        Divider()
                                    }
                                }
                                
                                
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                        
                        
                        
                    }
                    .onAppear {
                        documentsViewModel.fetchDocuments(numeroEmpleado: "12345") // Ejecuta la función al aparecer la vista
                    }
                }
                .navigationDestination(for: DocumentsRouter.Destination.self) { destination in
//                    switch destination {
//                    case .movementDetail: MovementDetailView(navigationOrigin: .home)
//                    
//                    }
                }
                VStack(alignment: .trailing) {
                    Spacer()
                    Image(systemName: "arrow.down.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.bluePrimary)
                        .frame(width: 32, height: 32)
                        .onTapGesture {
                            messageToast = "Descargando todo..."
                            showToast = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showToast = false
                                
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding([.trailing, .bottom], 16)
                }
                

            }
            
        }
        .environmentObject(documentsRouter)
    }
}

enum typeDpcument: Int {
    case pdf
    case excel
    case word
}
