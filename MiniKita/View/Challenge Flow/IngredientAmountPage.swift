//
//  SwiftUIView4.swift
//  MiniKita
//
//  Created by Esther Gabriel Trivena on 20/05/24.
//

import SwiftUI

struct IngredientAmountPage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var selectedUnits = "gram"
    @State var value : Int = 1
    
    @State private var navigateToNextPage = false
    @State var progress: CGFloat = 0.6
    
    @StateObject var viewModel = ViewModel()

    
    var body: some View {
        NavigationStack{
            VStack{
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
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    withAnimation {
                                        viewModel.isPickerVisible.toggle()
                                    }
                                }
                        }
                        .contentShape(Rectangle())
                        
                        if viewModel.isPickerVisible {
                            FoodUnitsPicker(
                                selection: $viewModel.selection,
                                values: Array(1..<350),
                                units: FoodUnits.Unit.allCases
                            )
                        }
                    }
                    .frame(height: 50)
                    
                    VStack(alignment: .leading){
                        Text("Nutricions Fact")
                            .font(.callout)
                            .fontWeight(.medium)
                        
                        HStack(alignment: .center){
                            Text("156 kCal")
                                .font(.system(size: 24))
                                .fontWeight(.medium)
                            
                            ProgressBar(progress: progress, height: 4)
                                .frame(height: 10)
                                .padding(.top, 4)
                        }
                        
                        
                        Text("100% of your daily proteins (156 kCal)")
                            .hSpacing(.leading)
                            .font(.caption)
                    }
                    .padding(0)
                    .listRowBackground(Color("AntiFlashWhite"))
                    
                }
            }
        }
        .navigationTitle("Breast")
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.antiFlashWhite)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                
                Button("Done") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

extension IngredientAmountPage {
    final class ViewModel: ObservableObject {
        @Published var selection = FoodUnits(value: 1, unit: .grams)
        @Published var isPickerVisible = false
    }
}


#Preview {
    NavigationStack {
        IngredientAmountPage()
    }
}
