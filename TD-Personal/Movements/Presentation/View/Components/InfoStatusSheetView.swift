//
//  InfoStatusSheetView.swift
//  TD-Personal
//
//  Created by Moises Alejandro Sanchez Vergara on 30/01/25.
//

import SwiftUI

struct InfoStatusSheetView: View {
    let contentInfo: String
    let status: Status
    @Binding var showBottomInfo:Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                HStack(alignment: .center, spacing: 12) {
                    CircleStatusView(status: status)
                    Text(status.nameStatus)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.bluePrimary)
                }
                Spacer()
                Image(systemName: "xmark")
                    .frame(width: 16, height: 16)
                    .foregroundColor(.bluePrimary)
                    .onTapGesture {
                        showBottomInfo = false
                    }
            }
            Text(contentInfo)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.bluePrimary)
        }
        .padding()
    }
}
