import SwiftUI

struct MainView: View {
    @Environment(GameViewModel .self) var gVM
    @State var showSettingView: Bool = false
    
    var body: some View {
        ZStack {
            GearIconView(showSettingView: $showSettingView)
            VStack {
                ScoreView(currentScore: gVM.gameModel.score, totalScore: gVM.gameModel.maxTurns)
                Spacer()
                Text(showSettingView ? "Setting appearing" : "Setting is hidden")
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
