import SwiftUI

struct ContentView: View {
    @StateObject var homeRouter = HomeRouter()
    @StateObject var movementsRouter = MovementsRouter()
    @StateObject var documentsRouter = DocumentsRouter()
    @StateObject var calendarRouter = CalendarRouter()
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
            CalendarHeaderView()
                .tabItem {
                    Label("Calendario", systemImage: "calendar")
                }
                .modelContainer(Activity.preview)
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
        .environmentObject(calendarRouter)
    }
}


#Preview {
    ContentView()
}
