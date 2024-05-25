import SwiftUI

struct ActivityLevelView: View {
    @EnvironmentObject var model: OnboardingViewModel
    
    var body: some View {
        ScrollView {
            VStack {
//                Text("Activity Level")
//                    .font(.title)
//                    .padding(.top)
                activityLevel
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
    var activityLevel: some View {
        VStack(alignment: .leading) {
            // Headline
            Text("How often do you actively move or break a sweat?")
              .font(
                Font.custom("SF Pro", size: 17)
                  .weight(.semibold)
              )
              .foregroundColor(.black)
              .frame(width: 358, alignment: .topLeading)
            
            VStack(alignment: .leading) {
                ForEach(0..<self.model.activelyMove.count, id: \.self) { index in
                    RoundedRectangleButton(title: model.activelyMove[index], type: self.model.selectedActivelyMoveType, index: index, action: {
                        self.model.selectedActivelyMoveType = index
                    })
                }
            }
        }
        .padding(15)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(15)
        .padding(.horizontal, 15)
        .padding(.bottom, 15)
    }
    
}

struct WorkoutInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityLevelView()
            .environmentObject(OnboardingViewModel())
    }
}
