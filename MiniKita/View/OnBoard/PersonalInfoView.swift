//
//  PersonalInfoView.swift
//  MiniKita
//
//  Created by Naufal Satya Akbari on 25/05/24.


import SwiftUI

struct PersonalInfoView: View {
        @State private var selectedDate = Date()
        
        var dateRange: ClosedRange<Date> {
            let calendar = Calendar.current
            let start = DateComponents(year: 1950, month: 2, day: 1)
            let end = DateComponents(year: 2024, month: 2, day: 1)
            return calendar.date(from: start)! ... calendar.date(from: end)!
        }
        
        var body: some View {
                DatePicker(
                    "Select Date",
                    selection: $selectedDate,
                    in: dateRange,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.compact)
                
            .padding()
        }
//        ZStack {
//            VStack {
//                // Footnote
//                Text("Enter the name you would like to go by,")
//                  .font(Font.custom("SF Pro", size: 13))
//                  .foregroundColor(.black)
//                
//                
//                HStack(alignment: .top, spacing: 0) {
//                    // Body/Regular
//                    Text("Name")
//                      .font(Font.custom("SF Pro", size: 17))
//                      .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.3))
//                      .frame(maxWidth: .infinity, alignment: .leading)
//                     }
//                .padding(.horizontal, 16)
//                .padding(.vertical, 0)
//                .frame(width: 390, alignment: .topLeading)
//                
//            }
//        }
//        .frame(width: 390, height: 844)
//        .background(Color(red: 0.95, green: 0.95, blue: 0.97))
}

#Preview {
    PersonalInfoView()
}

//import Foundation
//import SwiftUI
//
//struct PersonalInfoView: View {
//    @State private var selectedDate = Date()
//    
//    var dateRange: ClosedRange<Date> {
//        let calendar = Calendar.current
//        let start = DateComponents(year: 1950, month: 2, day: 1)
//        let end = DateComponents(year: 2024, month: 2, day: 1)
//        return calendar.date(from: start)! ... calendar.date(from: end)!
//    }
//    
//    var body: some View {
//        VStack {
//            DatePicker(
//                "Select Date",
//                selection: $selectedDate,
//                in: dateRange,
//                displayedComponents: [.date]
//            )
//            .datePickerStyle(.compact)
//            
//        }
//        .padding()
//    }
//}
//
//struct DatePickerPlayground_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonalInfoView()
//    }
//}
