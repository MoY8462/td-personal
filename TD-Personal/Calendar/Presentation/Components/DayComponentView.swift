//
//  DayComponentView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 27/02/25.
//

import SwiftUI

struct DayComponentView: View {
    var dayInfo: DayInfo
    @State var showBottomInfo: Bool = false
    var body: some View {
        HStack(spacing: 12) {
            Text(dayInfo.date.formatted(.dateTime.day()))
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: 30, minHeight: 40)
                .background(
                    Circle()
                        .foregroundStyle(
                            Color.bluePrimary.opacity(0.8)
                        )
                )
            Text(dayInfo.title ?? "No encontrado")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.bluePrimary)
            Image(systemName: "info.circle")
                .font(.system(size: 20, weight: .regular))
                .frame(width: 20, height: 20)
                .foregroundColor(.bluePrimary)
                .onTapGesture {
                    showBottomInfo.toggle()
                }
            Spacer()
        }
        .sheet(
            isPresented: $showBottomInfo,
            content: {
                InfoMessageDayView(
                    title: dayInfo.title ?? "No existe información a mostrar",
                    contentInfo: dayInfo.message ?? "No existe información a mostrar",
                    showBottomInfo: $showBottomInfo
                )
                .presentationDetents([.fraction(0.2)])
        })
    }
}

#Preview {
//    DayComponentView(day: Date())
}
