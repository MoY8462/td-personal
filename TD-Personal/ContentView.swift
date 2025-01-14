import SwiftUI

struct ContentView: View {
    @StateObject var homeRouter = HomeRouter()
    @StateObject var movementsRouter = MovementsRouter()
    @StateObject var documentsRouter = DocumentsRouter()
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Inicio", systemImage: "house")
                }
            MovimientosView()
                .tabItem {
                    Label("Movimientos", systemImage: "arrow.left.arrow.right")
                }
            DocumentosView()
                .tabItem {
                    Label("Documentos", systemImage: "doc.text")
                }
            MiCuentaView()
                .tabItem {
                    Label("Mi Cuenta", systemImage: "person.circle")
                        .foregroundColor(Color("blue"))
                }
        }
        .accentColor(Color("blue"))
        .environmentObject(homeRouter)
        .environmentObject(movementsRouter)
        .environmentObject(documentsRouter)
    }
}


#Preview {
    ContentView()
}
