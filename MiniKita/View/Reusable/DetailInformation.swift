//
//  DetailInformation.swift
//  MiniKita
//
//  Created by Anjar Harimurti on 26/05/24.
//

import SwiftUI

struct DetailInformation: View {
    
    var informationType : InformationType = .text
    var isInputInt : Bool = false
    
    var informationName : String = ""
    @Binding var informationValue: String
    @Binding var informationValueInt: Int
    
    var additionalInformation: String = ""
    var isHaveDetail: Bool = false
    var detailInformation: [String] = []
    var inputTextPosition: TextAlignment = .trailing
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if !informationName.isEmpty {
                    Text(informationName)
                        .font(.body)
                }
                
                if isHaveDetail {
                    if !detailInformation.isEmpty {
                        Text(detailInformation.joined(separator: ", "))
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    } else {
                        Text("(none)")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                }
            }
            
            Spacer()

            if informationType == .text {
                if !informationValue.isEmpty {
                    Text(informationValue)
                }
            } else {
                if isInputInt {
                    TextField(
                        informationName,
                        value: $informationValueInt,
                        formatter: NumberFormatter()
                    )
                    .multilineTextAlignment(inputTextPosition)
                    .keyboardType(.numberPad)
                } else {
                    TextField(
                        informationName,
                        text: $informationValue
                    )
                    .multilineTextAlignment(inputTextPosition)
                    .frame(alignment: .trailing)
                }
                
            }
            if !additionalInformation.isEmpty {
                Text(additionalInformation)
                    .foregroundStyle(.gray)
            }
            
        }
    }
}

#Preview {
    DetailInformation(
        informationType: .inputText,
        isInputInt: false,
        informationName: "Weight",
        informationValue: .constant("Heheh"),
        informationValueInt: .constant(0),
        additionalInformation: "Kg",
        detailInformation: ["Chicken", "Pizza"]
    )
}
