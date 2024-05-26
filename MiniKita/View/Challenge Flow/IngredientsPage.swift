import SwiftUI

struct IngredientsPage: View {
    
    var selectedNutrient = ""
    
    @State var nutritionIngredients: [Ingredient] = []
    
    @State private var selectedIngredient = Ingredient()
    @State private var navigateToNextPage = false
    
    @ObservedObject var intakeViewModel : IntakeViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        Text("What's your pick to charge your day? 🥩🍗🍳")
                            .font(.headline)
                        
                        LazyVGrid(
                            columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible())
                            ],
                            spacing: 12
                        ) {
                            ForEach(nutritionIngredients, id: \.self) { ingredient in
                                
                                LongButtonHighlight(
                                    label: ingredient.ingredientName,
                                    buttonColor: (ingredient == selectedIngredient) ?
                                    Color("CarrotOrange") : Color("GhostWhite"),
                                    textColor: (ingredient == selectedIngredient) ?
                                    Color("AntiFlashWhite") : Color("RaisinBlack"),
                                    action: {
                                        selectedIngredient = ingredient
                                        intakeViewModel.selectedIngredient = selectedIngredient
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            navigateToNextPage = true
                                        }
                                    }
                                )
                            }
                            .navigationDestination(
                                isPresented: $navigateToNextPage
                            ) {
                                IngredientPartPage(intakeViewModel: intakeViewModel)
                            }
                        }
                        .padding(.top, 24)
                    }
                    .padding(16)
                    
                    HStack {
                        VStack{
                            Image("ngintip")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 100,maxHeight: 100,alignment: .leading)
                                .listRowInsets(EdgeInsets())
                        }.frame(width: 100)
                        
                        ZStack {
                            SpeechBubble()
                                .fill(.ghostWhite)
                                .stroke(.platinum, lineWidth: 1.5)
                                .shadow(color : .platinum,radius: 2, x : 0, y:5.22)
                            
                            Text("When choosing which protein to eat, ensure that the foods you pick provide you with the best all-around nutrition possible.")
                                .padding(10)
                                .foregroundColor(.graniteGray)
                            
                        }
                        .frame(width: 270, height: 120)
                        
                    }
                    .hSpacing(.leading)
                    .padding(.top, 41)
                }
            }
            .navigationTitle(selectedNutrient)
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.antiFlashWhite)
            .onAppear {
                nutritionIngredients = intakeViewModel.filteredIngredients.filter {
                    $0.nutritionType.rawValue == selectedNutrient
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        IngredientsPage(
            selectedNutrient: NutritionType.protein.rawValue,
            intakeViewModel: IntakeViewModel()
        )
    }
}
