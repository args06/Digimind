import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer(minLength: 300)
                    
                Text("Welcome!")
                    .font(
                        Font.custom("SF Pro", size: 48)
                            .weight(.semibold)
                    )
                    .foregroundColor(Color(red: 0.84, green: 0.43, blue: 0.01))
                
                Text("Ready to jumpstart your fun and healthy lifestyle?")
                    .font(Font.custom("SF Pro", size: 15))
                    .fontWeight(.regular)
                    .padding([.leading, .trailing])
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.23, green: 0.23, blue: 0.24))
                
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 292, height: 304)
                    .background(
                        Image("CropMascot")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 292, height: 304)
                            .clipped()
                    )
                    .frame(width: 235, height: 368)
                    .padding(.bottom, -45)
                
                
                
            }
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 542, height: 548.6969)
                    .background(
                        Image("CropOrange")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 542, height: 548.6968994140625)
                            .clipped()
                            .opacity(0.8)
                    )
                    .cornerRadius(607)
                VStack{
                    
                    Text("NgeMeal isn’t a substitute for professional advice.\nAlways consult your doctor or nutritionist first.")
                        .font(Font.custom("SF Pro", size: 11))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.92))
                        .frame(width: 358, alignment: .center)
                    
                        .safeAreaInset(edge: .bottom) {
                            NavigationLink {
                                OnboardView()
                            } label: {
                                Text("action_connect_health_kit")
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                    .hSpacing()
                                    .frame(height: 50)
                                    .background(Color(red: 0.17, green: 0.76, blue: 0.69))
                                    .cornerRadius(12)
                                    .padding(.horizontal, 80)
                            }
                            .buttonStyle(.plain)
                            .padding(.horizontal, 16)
                        }
                }
            }
            
        }
    }
}

#Preview {
    WelcomeView()
}
