//
//  PreviousButton.swift
//  MiniKita
//
//  Created by Naufal Satya Akbari on 25/05/24.
//


import SwiftUI

enum CustomNextButton: String {
    case next = "Next"
}

struct CustomNavigationNextButton: View {
    var type: CustomNextButton
    var buttonColor: Color = Color("IguanaGreen")
    var textColor: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(type.rawValue)
                .foregroundStyle(textColor)
                .font(.headline)
                .hSpacing()
                .frame(height: 50)
                .background(buttonColor, in: .rect(cornerRadius: 12))
        })
        .buttonStyle(.plain)
        .cornerRadius(11)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(buttonColor, lineWidth : 1)
            .opacity(type == .next ? 1 : 0)
        )
    }
}

struct CustomNavigationNextButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CustomNavigationNextButton(type: .next, action: {})
        }
    }
}

