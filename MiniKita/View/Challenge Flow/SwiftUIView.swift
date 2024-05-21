import SwiftUI

struct SwiftUIView: View {
    
    var protein: [String] = [
        "🍗Chicken", "🥚Egg", "🫘Tempeh", "🫘Tofu", "🥩Beef", "🍣Salmon", "🍣Tuna", "🍤Prawn", "🧀Cheese", "🌻Sunflower Seed","🫘Soya Bean", "🥜Almond", "🍶Yoghurt"
    ]
    
    @State private var selectedProtein = ""
    @State private var navigateToNextPage = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing:25){
                Text("Protein")
                Text("What's your pick to charge your day? 🥩🍗🍳")
                
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: 12
                ) {
                    ForEach(protein, id: \.self) { protein in
                        Button(action: {
                            selectedProtein = protein
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                navigateToNextPage = true
                            }
                        }) {
                            Text(protein)
                                .frame(width: 150)
                                .padding(12)
                                .background(
                                    (protein == selectedProtein) ?
                                    Color("CarrotOrange") : Color("GhostWhite"))
                                .foregroundColor(
                                    (protein == selectedProtein) ?
                                    Color("AntiFlashWhite") : Color("RaisinBlack"))
                                .cornerRadius(12)
                                .border(Color("GhostWhite"), width: 0.65)
                                .shadow(color : Color("Platinum"),radius: 2,x : 0, y:4)
                        }
                        .background(
                            NavigationLink(destination: SwiftUIView2(), isActive: $navigateToNextPage) {
                                EmptyView()
                            }
                                .hidden()
                        )
                    }
                }
                .padding(18)
                
                HStack {
                    VStack{
                        Image("ngintip")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: 100,maxHeight: 100,alignment: .leading)
                            .listRowInsets(EdgeInsets())
                    }.frame(width: 100)
                    
//                    VStack(alignment: .leading) {
//                        // header
////                        HStack {
////                            Text("+123456")
////                                .bold()
////                            Spacer() // Spacer here!
////                            Text("~abcd")
////                        }
////                        .foregroundStyle(.secondary)
//                        
//                        // text
//                        Text("When choosing which protein to eat, ensure that the foods you pick provide you with the best all-around nutrition possible.")
//                            .padding(.vertical, 5)
//                        
//                        // timestamp
////                        Text("12:00 PM")
////                            .frame(maxWidth: .infinity, alignment: .trailing)
//                        
//                    }
//                    .padding()
//                    .background(Color("GhostWhite"))
//                    .cornerRadius(10.43)
//                    .border(Color("GhostWhite"), width: 0.65)
//                    .frame(width: 270, alignment: .leading)
//                    .foregroundColor(Color("GraniteGray"))
                    ZStack {
                        SpeechBubble1()
                            .stroke(Color("Platinum"), lineWidth: 1.5)
                            .background(Color("GhostWhite"))

                        Text("When choosing which protein to eat, ensure that the foods you pick provide you with the best all-around nutrition possible.")
                        .padding(10)
                        .shadow(color : Color("Platinum"),radius: 2,x : 0, y:5.22)
                    }
                    .frame(width: 270, height: 120)
                    .foregroundColor(Color("GraniteGray"))
                }
                .frame(maxWidth: .infinity,alignment: .leading)
            }
        }
        .background(Color("AntiFlashWhite"))
    }
}

struct SpeechBubble1: Shape {
    private let radius: CGFloat
    private let tailSize: CGFloat

    init(radius: CGFloat = 10) {
        self.radius = radius
        tailSize = 20
    }

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY - radius))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - rect.height / 2))
            path.addCurve(
                to: CGPoint(x: rect.minX, y: rect.maxY - rect.height / 2 - tailSize),
                control1: CGPoint(x: rect.minX - tailSize, y: rect.maxY - rect.height / 2),
                control2: CGPoint(x: rect.minX, y: rect.maxY - rect.height / 2 - tailSize / 2)
            )
            path.addArc(
                center: CGPoint(x: rect.minX + radius, y: rect.minY + radius),
                radius: radius,
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius),
                radius: radius,
                startAngle: Angle(degrees: 270),
                endAngle: Angle(degrees: 0),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius),
                radius: radius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false
            )
            path.addArc(
                center: CGPoint(x: rect.minX + radius, y: rect.maxY - radius),
                radius: radius,
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
        }
    }
}

#Preview {
    SwiftUIView()
}
