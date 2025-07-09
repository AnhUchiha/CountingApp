import SwiftUI

struct MainView: View {
    @Environment(GameViewModel .self) var gVM
    @State private var showSettingView: Bool = false
    @State private var showLanguage: Bool = false
    
    var body: some View {
        ZStack {
            GearIconView(showSettingView: $showSettingView)
            VStack {
                ScoreView(currentScore: gVM.gameModel.score, totalScore: gVM.gameModel.maxTurns)
                
                Toggle(showLanguage ? "English" : "VietNamese", isOn: $showLanguage.animation())
                    .padding()
                
                QuestionView(showLanguage: $showLanguage)
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
