//
//  ProgressBar.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 21/05/24.
//

import SwiftUI

struct ProgressBar: View {
    let progress: CGFloat
    var height: CGFloat
    
    var backgroundColor: Color = .phillipineGray
    var foregroundColor: Color = .carrotOrange
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: height)
                        .opacity(0.3)
                        .foregroundColor(backgroundColor)
                        .cornerRadius(12)
                    
                    Rectangle()
                        .frame(
                            width: min(progress * geometry.size.width,
                                       geometry.size.width),
                            height: height
                        )
                        .foregroundColor(foregroundColor)
                        .cornerRadius(12)
                }
            }
        }
    }
}

#Preview {
    ProgressBar(progress: 0.72, height: 4)
}
