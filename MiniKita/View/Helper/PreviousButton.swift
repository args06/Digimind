////
////  PreviousButton.swift
////  MiniKita
////
////  Created by Naufal Satya Akbari on 25/05/24.
////
//
//import SwiftUI
//
//enum CustomButtonPrevType: String {
//    //    case next = "Next"
//    case previous = "chevron.left"
//}
//
//struct CustomNavigationPrevButton: View {
//    var type: CustomButtonPrevType
//    var action: () -> Void
//    
//    var body: some View {
//        Button(action: {
//            
//        }, label: {
//            Image(systemName: "chevron.left")
//                .foregroundColor(.black)
//                .padding(.vertical, 10)
//                .padding(.horizontal)
//                .cornerRadius(10)
//        })
//
//        .buttonStyle(.plain)
//    }
//}
//
//struct CustomNavigationPrevButton_Previews: PreviewProvider {
//    static var previews: some View {
//        HStack {
//            CustomNavigationPrevButton(type: .previous, action: {})
//            //            CustomNavigationButton(type: .next, action: {})
//        }
//    }
//}


//
//  PreviousButton.swift
//  MiniKita
//
//  Created by Naufal Satya Akbari on 25/05/24.
//


import SwiftUI

enum CustomPrevButton: String {
    case previous = "chevron.left"
}

struct CustomNavigationPrevButton: View {
    var type: CustomPrevButton
    var buttonColor: Color = Color("IguanaGreen")
    var imageColor: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: type.rawValue)
                .foregroundColor(imageColor)
                .font(.headline)
                .padding()
                .frame(height: 50)
                .background(buttonColor)
                .cornerRadius(12)
        })
        .buttonStyle(.plain)
        .cornerRadius(11)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(buttonColor, lineWidth: 1)
            .opacity(type == .previous ? 1 : 0)
        )
    }
}

struct CustomNavigationPrevButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CustomNavigationPrevButton(type: .previous, action: {})
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}


