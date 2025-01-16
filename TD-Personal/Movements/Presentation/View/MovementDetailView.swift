//
//  MovementDetailView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 08/01/25.
//

import Foundation
import SwiftUI

struct MovementDetailView: View {
    @State private var progress: Double = 0.0
    var navigationOrigin: NavigationOrigin
    
    var body: some View {
        VStack {
            switch navigationOrigin {
            case .home:
                NavBarSecondary(title: .home)
            case .movements:
                NavBarSecondary(title: .movements)
            default:
                NavBarSecondary(title: .documents)
            }
            ScrollView {
                VStack {
                    MilestoneProgressView()
                }
            }
            
        }
        .navigationBarHidden(true)
        
    }
}

struct MilestoneProgressView: View {
    
    @State private var count: Float = 8
    @State private var radius: CGFloat = 15
    @State private var lineWidth: CGFloat = 5
    @State private var progress: CGFloat = 0.1
    
    var body: some View {
        GeometryReader { bounds in
            VStack(spacing: 70) {
                MilestoneShape(count: Int(count), radius: radius)
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(.indigo.opacity(0.3))
                    .padding(.horizontal, lineWidth/2)
                    .overlay {
                        MilestoneShape(count: Int(count), radius: radius)
                            .stroke(lineWidth: lineWidth)
                            .foregroundColor(.indigo)
                            .padding(.horizontal, lineWidth/2)
                            .mask(
                                HStack {
                                    Rectangle()
                                        .frame(width: bounds.size.width * progress, alignment: .leading)
                                        .blur(radius: 2)
                                    Spacer(minLength: 0)
                                }
                            )
                    }
                    .padding(.horizontal, lineWidth/2)
                    .rotationEffect(.degrees(90)) // Rotar 90 grados
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .frame(width: .infinity)
                
//                controls
            }
        }
        .padding()
    }
    
    @ViewBuilder private var controls: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading) {
                Slider(value: $progress, in: 0...1)
                Text("Progress")
            }
            
            VStack(alignment: .leading) {
                Slider(value: $count, in: 3...7)
                Text("Count")
            }
            
            VStack(alignment: .leading) {
                Slider(value: $radius, in: 5...25)
                Text("Radius")
            }
            
            VStack(alignment: .leading) {
                Slider(value: $lineWidth, in: 2...30)
                Text("Line Width")
            }
        }
    }
    
    struct MilestoneShape: Shape {
        let count: Int
        let radius: CGFloat
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: 0, y: rect.midY))
            
            var maxX: CGFloat = 0
            let remainingSpace: CGFloat = rect.width - (CGFloat(count)*radius*2)
            let lineLength: CGFloat = remainingSpace / CGFloat(count - 1)
            
            for i in 1...count {
                path.addEllipse(in: CGRect(origin: CGPoint(x: maxX, y: rect.midY - radius), size: CGSize(width: radius*2, height: radius*2)))
                maxX += radius*2
                path.move(to: CGPoint(x: maxX, y: rect.midY))
                if i != count {
                    maxX += 30
                    path.addLine(to: CGPoint(x: maxX, y: rect.midY))
                }
            }
            
            return path
        }
    }
}
