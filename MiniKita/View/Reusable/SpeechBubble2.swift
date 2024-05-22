//
//  SpeechBubble2.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 21/05/24.
//

import Foundation
import SwiftUI

struct SpeechBubble2: Shape {
    private let radius: CGFloat
    private let tailSize: CGFloat
    
    init(radius: CGFloat = 10, tailSize: CGFloat = 20) {
        self.radius = radius
        self.tailSize = tailSize
    }
    
    func path(in rect: CGRect) -> Path {
        let tailHeight = tailSize / 2
        
        return Path { path in
            // Start at the bottom center point where the tail begins
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            
            // Draw left side of the tail
            path.addLine(to: CGPoint(x: rect.midX - tailSize / 2, y: rect.maxY - tailHeight))
            
            // Draw bottom-left corner arc
            path.addArc(
                center: CGPoint(x: rect.minX + radius, y: rect.maxY - tailHeight - radius),
                radius: radius,
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
            
            // Draw left side
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + radius))
            
            // Draw top-left corner arc
            path.addArc(
                center: CGPoint(x: rect.minX + radius, y: rect.minY + radius),
                radius: radius,
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270),
                clockwise: false
            )
            
            // Draw top side
            path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
            
            // Draw top-right corner arc
            path.addArc(
                center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius),
                radius: radius,
                startAngle: Angle(degrees: 270),
                endAngle: Angle(degrees: 0),
                clockwise: false
            )
            
            // Draw right side
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - tailHeight - radius))
            
            // Draw bottom-right corner arc
            path.addArc(
                center: CGPoint(x: rect.maxX - radius, y: rect.maxY - tailHeight - radius),
                radius: radius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false
            )
            
            // Draw right side of the tail
            path.addLine(to: CGPoint(x: rect.midX + tailSize / 2, y: rect.maxY - tailHeight))
            
            // Close the path by drawing the tail
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}

#Preview {
    SpeechBubble2()
        .fill(.iguanaGreen)
}
