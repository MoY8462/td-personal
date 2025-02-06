//
//  HomeView.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 04/12/24.
//
import SwiftUI

struct HomeView: View {
    @ObservedObject var homeRouter = HomeRouter()
    @StateObject var homeViewModel = HomeViewModel()
    var body: some View {
        NavigationStack(path: $homeRouter.navPath) {
            VStack {
                NavBarHome()
                ScrollView {
                    HStack {
                        Image(systemName: "newspaper.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.bluePrimary)
                            .frame(width: 24, height: 26)
                        Text("Noticias")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.bluePrimary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    if !homeViewModel.items.isEmpty {
                        CarouselView(items: homeViewModel.items)
                            .frame(height: 200)
                            .padding(.vertical, 8)
                    }
                    HStack {
                        Image(systemName: "clock.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.bluePrimary)
                            .frame(width: 24, height: 26)
                        Text("Ventanillas")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.bluePrimary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
//                    Button("Navegar",action: {
//                        homeRouter.navigate(to: .movementDetail)
//                    })
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .onAppear {
                homeViewModel.fetchCarousel()
            }
            .navigationDestination(for: HomeRouter.Destination.self) { destination in
//                    switch destination {
//                    case .movementDetail: MovementDetailView(navigationOrigin: .home)
//                    }
                }
        }
        .environmentObject(homeRouter)
        
    }
}



struct CarouselView: View {
    let items: [CarouselItem]
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                    if let imageData = Data(base64Encoded: item.imagen.split(separator: ",").last.map(String.init) ?? ""),
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .tag(index)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}
