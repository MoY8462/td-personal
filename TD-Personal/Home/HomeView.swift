//
//  HomeView.swift
//  TD-Personal
//
//  Created by Moises Sanchez on 04/12/24.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "newspaper.fill")
                    Text("Noticias")
                        .font(.system(size: 16, weight: .semibold))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                CarouselView(images: ["Carrousel", "Carrousel", "Carrousel"])
                    .frame(height: 200)
                    .padding(.vertical)

                Spacer()
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("Profile")
                            .padding(.leading, 4)
                        Text("Hola Moisés")
                            .font(.system(size: 16, weight: .semibold))
                        
                        Spacer()
                        Image(systemName: "bell.fill")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 8)
                    
                }
                
            }.frame(maxWidth: .infinity)
        }
    }
}

struct CarouselView: View {
    let images: [String]
    @State private var selectedTab = 0
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ForEach(Array(images.enumerated()), id: \.element) { index, imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
        }
    }
}
