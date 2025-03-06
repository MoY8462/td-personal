//
//  InfoMessageDayView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 27/02/25.
//

import SwiftUI

struct InfoMessageDayView: View {
    let title: String
    let contentInfo: String
    @Binding var showBottomInfo:Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.bluePrimary)
                Spacer()
                Image(systemName: "xmark")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.bluePrimary)
                    .onTapGesture {
                        showBottomInfo = false
                    }
            }
            .padding(.bottom)
            Text(contentInfo)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.bluePrimary)
        }
        .padding()
    }
}

#Preview {
//    InfoMessageDayView()
}
