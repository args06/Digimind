//
//  SwiftUIView2.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 20/05/24.
//

import Foundation
import SwiftUI

struct SwiftUIView2: View {
    
    var olahan: [String] = [
        "Fried", "Stew", "Roast"
    ]
    
    @State private var selectedOlahan = ""
    @State private var navigateToNextPage = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing:25){
                Text("Ayam")
                Text("How are you preparing your meals today?")
                
                LazyVGrid(
                    columns: [
                        GridItem(.flexible())
                    ],
                    spacing: 12
                ) {
                    ForEach(olahan, id: \.self) { olahan in
                        Button(action: {
                            selectedOlahan = olahan
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                navigateToNextPage = true
                            }
                        }) {
                            Text(olahan)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .padding(12)
                                .background(
                                    (olahan == selectedOlahan) ?
                                    Color("CarrotOrange") : Color("GhostWhite"))
                                .foregroundColor(
                                    (olahan == selectedOlahan) ?
                                    Color("AntiFlashWhite") : Color("RaisinBlack"))
                                .cornerRadius(12)
                                .border(Color("GhostWhite"), width: 0.65)
                                .shadow(color : Color("Platinum"),radius: 2,x : 0, y:4)

                        }
                        .background(
                            NavigationLink(destination: SwiftUIView3(), isActive: $navigateToNextPage) {
                                EmptyView()
                            }
                            .hidden()
                        )
                    }
                }
                .padding(18)
                
                VStack {
                    
                    VStack(alignment: .center) {
                        // header
//                        HStack {
//                            Text("+123456")
//                                .bold()
//                            Spacer() // Spacer here!
//                            Text("~abcd")
//                        }
//                        .foregroundStyle(.secondary)
                        
                        // text
                        Text("Did you know? The less processed your food, the better it is for you! Whole foods pack more nutrients and fewer additives, making them the healthier choice for your body. 🌿🍎🍞")
                            .padding(.vertical, 5)
                        // timestamp
//                        Text("12:00 PM")
//                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                    .frame(maxWidth: 300, alignment: .center)
                    .padding()
                    .background(Color("GhostWhite"))
                    .cornerRadius(16)
                    .foregroundColor(Color("GraniteGray"))
                    .shadow(color : Color("Platinum"),radius: 2,x : 0, y:5.22)
                    
                    VStack{
                        Image("olahan")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: 100,maxHeight: 200)
                            .listRowInsets(EdgeInsets())
                    }.frame(width: 100)
                    
                }.frame(alignment: .leading)
            }
        }
    }
}

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
                path.addLine(to: CGPoint(x: rect.midX + tailSize / 2, y: rect.maxY - tailHeight))
                
                // Close the path by drawing the tail
                path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            }
        }
}


#Preview {
    SwiftUIView2()
}
