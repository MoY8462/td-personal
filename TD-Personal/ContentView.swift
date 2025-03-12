import SwiftUI

struct ContentView: View {
    @StateObject var homeRouter = HomeRouter()
    @StateObject var myAccountRouter = MyAccountRouter()
    @StateObject var movementsRouter = MovementsRouter()
    @StateObject var documentsRouter = DocumentsRouter()
    @StateObject var calendarRouter = CalendarRouter()
    @StateObject var globalVariables = GlobalVariables()
    var body: some View {
        TabView(selection: $globalVariables.currentTab) {
            HomeView()
                .tabItem {
                    Label("Inicio", systemImage: "house")
                }
                .tag(Tab.home)
            if globalVariables.loginAuth {
                MovimientosView()
                    .tabItem {
                        Label("Movimientos", systemImage: "arrow.left.arrow.right")
                    }
                    .tag(Tab.movements)
            }
            CalendarHeaderView()
                .tabItem {
                    Label("Calendario", systemImage: "calendar")
                }
                .tag(Tab.calendar)
            if globalVariables.loginAuth {
                DocumentosView()
                    .tabItem {
                        Label("Documentos", systemImage: "doc.text")
                    }
                    .tag(Tab.documents)
            }
            MiCuentaView()
                .tabItem {
                    Label("Mi Cuenta", systemImage: "person.circle")
                        .foregroundColor(Color("blue"))
                }
                .tag(Tab.profile)
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
