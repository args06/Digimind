//
//  SwiftUIView2.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 20/05/24.
//

import Foundation
import SwiftUI

struct SwiftUIView3: View {
    
    var bagian: [String] = [
        "Breast", "Wings", "Thigh", "Fillet", "Drumstick"
    ]
    
    @State private var selectedBagian = ""
    @State private var navigateToNextPage = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing:25){
                Text("Stew")
                Text("Which part of Chicken do you eat?")
                
                LazyVGrid(
                    columns: [
                        GridItem(.flexible())
                    ],
                    spacing: 12
                ) {
                    ForEach(bagian, id: \.self) { bagian in
                        Button(action: {
                            selectedBagian = bagian
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                navigateToNextPage = true
                            }
                        }) {
                            Text(bagian)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .padding(12)
                                .background(
                                    (bagian == selectedBagian) ?
                                    Color("CarrotOrange") : Color("GhostWhite"))
                                .foregroundColor(
                                    (bagian == selectedBagian) ?
                                    Color("AntiFlashWhite") : Color("RaisinBlack"))
                                .cornerRadius(12)
                                .border(Color("GhostWhite"), width: 0.65)
                                .shadow(color : Color("Platinum"),radius: 2,x : 0, y:4)
                        }
                        .background(
                            NavigationLink(destination: SwiftUIView4(), isActive: $navigateToNextPage) {
                                EmptyView()
                            }
                            .hidden()
                        )
                    }
                }
                .padding(18)
            }
        }
    }
}

#Preview {
    SwiftUIView3()
}
