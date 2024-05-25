//
//  RoundedRectangleButton.swift
//  MiniKita
//
//  Created by Naufal Satya Akbari on 25/05/24.
//

import SwiftUI

struct RoundedRectangleButton: View {
    let title: String
    let type: Int
    let index: Int
    var hasCheckmark: Bool = true
    let action: () -> Void
    
    var body: some View {
        HStack {
            Button(action: { action() }) {
                if hasCheckmark {
                    HStack {
                        if type == index {
                            Image("checkmark-wht")
                        } else {
                            Circle().fill(Color.black.opacity(0.30)).frame(width: 28)
                        }
                        
                        Text(title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                } else {
                    HStack {
                        Text(title)
                            .padding(.leading, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(.horizontal, hasCheckmark ? 10 : 0)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(type == index ? Color.white : Color.black)
            .background(type == index ? Color.purple : Color.gray)
            .clipShape(Capsule())
        }
    }
}


struct CapsuleListButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VStack {
               RoundedRectangleButton(title: "title goes here", type: 0, index: 0, action: {})
                RoundedRectangleButton(title: "title goes here", type: 1, index: 2, action: {})
            }
            
            HStack {
                RoundedRectangleButton(title: "title 1", type: 0, index: 0, hasCheckmark: false, action: {})
                RoundedRectangleButton(title: "title 2", type: 1, index: 2, hasCheckmark: false, action: {})
                RoundedRectangleButton(title: "title 3", type: 1, index: 2, hasCheckmark: false, action: {})
            }
        }
    }
}
