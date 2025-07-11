import SwiftUI

struct OptionsView: View {
    @Environment(GameViewModel .self) var gVM
    var numbers: [Int]
    var answer: Int
    
    func Option(color: Color, value: Int) -> some View{
        return Button(action: {
            if value == answer {
                self.gVM.correctSound()
                self.gVM.gameModel.increaseScore()
            } else {
                self.gVM.incorrectSound()
            }
            self.gVM.gameModel.nextTurn()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(color)
                    .frame(width: 180, height: 180)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white.opacity(0.6), lineWidth: 2)
                    )
                Text("\(value)")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
            }
        })
    }

    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack{
                Spacer()
                Grid(alignment: .bottom){
                    GridRow{
                        Option(color: Color.red, value: numbers[0]);
                        Option(color: Color.green, value: numbers[1])
                    };
                    GridRow{
                        Option(color: Color.blue, value: numbers[2]);
                        Option(color: Color.yellow, value: numbers[3])
                    }
                }
            }
        }
    }
}

#Preview {
    OptionsView(numbers: [1, 2, 3, 4], answer: 4)
        .environment(GameViewModel())
}
