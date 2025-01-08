import SwiftUI

struct ContentView: View {
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
    }
}


#Preview {
    ContentView()
}
