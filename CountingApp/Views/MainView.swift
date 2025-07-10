import SwiftUI

struct MainView: View {
    @Environment(GameViewModel .self) var gVM
    @State private var showSettingView: Bool = false
    @State private var showLanguage: Bool = false
    @State private var done: Bool = false
    
    var gameOver: Bool{
        gVM.gameModel.gameWin
    }
    
    var body: some View {
        ZStack {
            GearIconView(showSettingView: $showSettingView)
                .padding()
            VStack {
                ScoreView(currentScore: gVM.gameModel.score, totalScore: gVM.gameModel.maxTurns)
                
                Toggle(showLanguage ? "English" : "VietNamese", isOn: $showLanguage.animation())
                    .padding()
                
                QuestionView(showLanguage: $showLanguage)
                Spacer()
                OptionsView(numbers: gVM.gameModel.alternatives, answer: gVM.gameModel.answer)
                    .onChange(of: gVM.gameModel.turns) { oldValue, newValue in
                        gVM.gameModel.generateNewProblem()
                    }
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
