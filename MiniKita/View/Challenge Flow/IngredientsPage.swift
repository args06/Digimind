import SwiftUI

struct IngredientsPage: View {
    
    var selectedNutrient = ""
    
    var ingredients: [String] = [
        "🍗Chicken", "🥚Egg", "🫘Tempeh", "🫘Tofu", "🥩Beef", "🍣Salmon", "🍣Tuna", "🍤Prawn", "🧀Cheese", "🌻Sunflower Seed","🫘Soya Bean", "🥜Almond", "🍶Yoghurt"
    ]
    
    @State private var selectedIngredient = ""
    @State private var navigateToNextPage = false
    
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
                            ForEach(ingredients, id: \.self) { ingredient in
                                
                                LongButton(
                                    label: ingredient,
                                    buttonColor: (ingredient == selectedIngredient) ?
                                    Color("CarrotOrange") : Color("GhostWhite"),
                                    textColor: (ingredient == selectedIngredient) ?
                                    Color("AntiFlashWhite") : Color("RaisinBlack"),
                                    action: {
                                        selectedIngredient = ingredient
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            navigateToNextPage = true
                                        }
                                    }
                                )
                            }
                            .navigationDestination(
                                isPresented: $navigateToNextPage
                            ) {
                                ProcessingPage()
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
                                .shadow(color : .platinum,radius: 2,x : 0, y:5.22)
                            
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
        }
    }
}

#Preview {
    NavigationStack {
        IngredientsPage(selectedNutrient: "Protein")
    }
}
