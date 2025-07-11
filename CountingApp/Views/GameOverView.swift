import SwiftUI

struct GameOverView: View {
    @Environment(GameViewModel.self) var gVM
    var solves: Int{
        gVM.gameModel.score
    }
    var total: Int {
        gVM.gameModel.maxTurns
    }
    
    var body: some View {
        ZStack {
            Color.white
            .ignoresSafeArea()
            
            VStack(spacing: 50) {
                VStack(spacing: 15) {
                    Text("Game Over")
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)
                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                    
                    Capsule()
                        .fill(Color.blue.opacity(0.6))
                        .frame(width: 100, height: 4)
                }
                
                VStack(spacing: 25) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 5)
                        .frame(width: 280, height: 100)
                        .overlay(
                            VStack(spacing: 10) {
                                Text("Bạn làm được \(solves) / \(total) câu")
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.center)
                                
                                Text("\(Int(Double(solves) / Double(total) * 100))% Complete")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundColor(.secondary)
                            }
                        )
                    
                    HStack(spacing: 15) {
                        ForEach(0..<total, id: \.self) { index in
                            Circle()
                                .fill(index < solves ? Color.green : Color.gray.opacity(0.3))
                                .frame(width: 25, height: 25)
                                .overlay(
                                    Text("\(index + 1)")
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(index < solves ? .white : .gray)
                                )
                                .scaleEffect(index < solves ? 1.0 : 0.9)
                        }
                    }
                }
                
                HStack(spacing: 20) {
                    ForEach(0..<3) { _ in
                        Circle()
                            .fill(Color.blue.opacity(0.4))
                            .frame(width: 8, height: 8)
                    }
                }
                Spacer()
                Text("Ấn bất kì để Reset Game")
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple, .pink],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .shadow(color: .gray.opacity(0.3), radius: 2, x: 1, y: 1)
            }
            .padding()
        }
        .onTapGesture {
            gVM.gameModel.resetGame()
        }
    }
}

#Preview {
    GameOverView()
        .environment(GameViewModel())
}
