import SwiftUI

struct ContentView: View {
    @StateObject var homeRouter = HomeRouter()
    @StateObject var myAccountRouter = MyAccountRouter()
    @StateObject var movementsRouter = MovementsRouter()
    @StateObject var documentsRouter = DocumentsRouter()
    @StateObject var calendarRouter = CalendarRouter()
    @StateObject var globalVariables = GlobalVariables()
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Inicio", systemImage: "house")
                }
            if globalVariables.loginAuth {
                MovimientosView()
                    .tabItem {
                        Label("Movimientos", systemImage: "arrow.left.arrow.right")
                    }
            }
            CalendarHeaderView()
                .tabItem {
                    Label("Calendario", systemImage: "calendar")
                }
                .modelContainer(Activity.preview)
            if globalVariables.loginAuth {
                DocumentosView()
                    .tabItem {
                        Label("Documentos", systemImage: "doc.text")
                    }
            }
            MiCuentaView()
                .tabItem {
                    Label("Mi Cuenta", systemImage: "person.circle")
                        .foregroundColor(Color("blue"))
                }
        }
        .accentColor(Color("blue"))
        .environmentObject(homeRouter)
        .environmentObject(myAccountRouter)
        .environmentObject(movementsRouter)
        .environmentObject(documentsRouter)
        .environmentObject(calendarRouter)
        .environmentObject(globalVariables)
    }
}


#Preview {
    ContentView()
}
