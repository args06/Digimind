//
//  SwiftUIView4.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 20/05/24.
//

import SwiftUI

struct SwiftUIView4: View {
    @State private var selectedUnits = "gram"
    @State var value : Int = 1
    @State private var navigateToNextPage = false
    @State var progress: CGFloat = 0.8
    
    @State private var selection1 = 1
    let items = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    
    @State private var selection2 = "1"
    let items2 = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Breast")
                Text("How much do you eat?")
                Form {
                    Section {
                        HStack {
                            Text("Breast")
                            Spacer()
                            Text("\(viewModel.selection.value) \(viewModel.selection.unit.rawValue)")
                                .frame(width: 130,height: 30)
                                .background(Color("AntiFlashWhite"))
                                .cornerRadius(8)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation {
                                viewModel.isPickerVisible.toggle()
                            }
                        }
                        if viewModel.isPickerVisible {
                            FoodUnitsPicker(selection: $viewModel.selection, values: Array(1..<1000), units: FoodUnits.Unit.allCases)
                        }
                    }
                    .frame(height: 50)
                    
                    Section{
                        VStack{
                            Text("Nutricions Fact")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            HStack{
                                Text("156 kCal")
                                CustomProgressView(progress: progress)
                                    .frame(height: 10)
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                            Text("100% of your daily proteins (156 kCal)")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                .fontWeight(.ultraLight)
                        }
                    }
                    .listRowBackground(Color("AntiFlashWhite"))

                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
                //.tint(Color("AntiFlashWhite"))
                //.background(Color("AntiFlashWhite"))
                //.scrollContentBackground(.hidden)

                }
            .background(Color("AntiFlashWhite"))
            .foregroundColor(Color("RaisinBlack"))
            }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity,alignment: .leading)
        .padding()
        .background(Color("AntiFlashWhite"))
        }
    }
    
extension SwiftUIView4 {
    final class ViewModel: ObservableObject {
        @Published var selection = FoodUnits(value: 1, unit: .grams)
        @Published var isPickerVisible = false
    }
}

    
    struct CustomProgressView: View {
        let progress: CGFloat
        
        var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: 10)
                        .opacity(0.3)
                        .foregroundColor(Color("PhillipineGray"))
                        .cornerRadius(12)
                    
                    Rectangle()
                        .frame(
                            width: min(progress * geometry.size.width,
                                       geometry.size.width),
                            height: 10
                        )
                        .foregroundColor(Color("CarrotOrange"))
                        .cornerRadius(12)
                }
            }
        }
    }

    
#Preview {
    SwiftUIView4()
}
