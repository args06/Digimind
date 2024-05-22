//
//  SwiftUIView5.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 21/05/24.
//

import SwiftUI

struct SpeechBubble: Shape {
    private let radius: CGFloat
    private let tailSize: CGFloat

    init(radius: CGFloat = 10, tailSize: CGFloat = 20) {
        self.radius = radius
        self.tailSize = tailSize
    }

    func path(in rect: CGRect) -> Path {
        let tailHeight = tailSize
        let tailWidth = tailSize

        return Path { path in
            // Start at the bottom center point where the tail begins
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            
            // Draw left side of the tail
            path.addLine(to: CGPoint(x: rect.midX - tailWidth / 2, y: rect.maxY - tailHeight))
            
            // Draw bottom-left corner arc
            path.addArc(
                center: CGPoint(x: rect.minX + radius, y: rect.maxY - tailHeight - radius),
                radius: radius,
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180),
                clockwise: true
            )
            
            // Draw left side
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + radius))
            
            // Draw top-left corner arc
            path.addArc(
                center: CGPoint(x: rect.minX + radius, y: rect.minY + radius),
                radius: radius,
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270),
                clockwise: true
            )
            
            // Draw top side
            path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
            
            // Draw top-right corner arc
            path.addArc(
                center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius),
                radius: radius,
                startAngle: Angle(degrees: 270),
                endAngle: Angle(degrees: 0),
                clockwise: true
            )
            
            // Draw right side
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - tailHeight - radius))
            
            // Draw bottom-right corner arc
            path.addArc(
                center: CGPoint(x: rect.maxX - radius, y: rect.maxY - tailHeight - radius),
                radius: radius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: true
            )
            
            // Draw right side of the tail
            path.addLine(to: CGPoint(x: rect.midX + tailWidth / 2, y: rect.maxY - tailHeight))
            
            // Close the path by drawing the tail
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}

struct SwiftUIView5: View {
    var body: some View {
        VStack {
            Text("Hello, this is a chat bubble with a tail!")
                .padding()
                .background(SpeechBubble()
                                .fill(Color.blue))
                .foregroundColor(.white)
                .frame(width: 200, height: 100)
        }
        .padding()
    }
}

#Preview {
    SwiftUIView5()
}
