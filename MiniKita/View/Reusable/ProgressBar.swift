//
//  ProgressBar.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 21/05/24.
//

import SwiftUI

struct ProgressBar: View {
    
    var width: CGFloat = UIScreen.main.bounds.size.width
    var height: CGFloat = 20
    var percent: CGFloat
    
    var backgroundColor: Color = .gray
    var foregroundColor: Color = .rajah
    
    var body: some View {
        
        let multliplier = width / 100
        
        ZStack(alignment: .leading) {
            RoundedRectangle(
                cornerRadius: height, style: .continuous
            )
            .frame(height: height)
            .foregroundColor(backgroundColor)
            
            RoundedRectangle(
                cornerRadius: height, style: .continuous
            )
            .frame(width: percent * multliplier ,height: height)
            .foregroundColor(foregroundColor)
        }
    }
}

#Preview {
    ProgressBar(percent: 72)
}
