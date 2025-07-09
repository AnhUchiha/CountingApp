import SwiftUI

struct QuestionView: View {
    @Environment(GameViewModel .self) var gVM
    @Binding var showLanguage: Bool
    
    var body: some View {
        VStack{
            if let engNum = EngVi.convertToString(num: gVM.gameModel.answer) {
                VStack(spacing: 16) {
                    VStack {
                        Text(engNum.english.capitalized)
                            .font(.title)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(12)
                    }

                    VStack {
                        Text(engNum.vietnam.capitalized)
                            .font(.title)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(12)
                            .opacity(showLanguage ? 1 : 0)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    QuestionView( showLanguage: .constant(false))
        .environment(GameViewModel())
}
