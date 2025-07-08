import SwiftUI

struct ScoreView: View {
    let currentScore: Int
    let totalScore: Int
    
    // Computed property to determine score color
    private var scoreColor: Color {
        let percentage = Double(currentScore) / Double(totalScore)
        switch percentage {
        case 0.8...1.0: return .green
        case 0.6..<0.8: return .orange
        default: return .red
        }
    }
    
    var body: some View {
        HStack(spacing: 8) {
            // Score icon
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(.title2)
            
            // Score text with gradient background
            Text("Score: \(currentScore)/\(totalScore)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [scoreColor, scoreColor.opacity(0.7)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(12)
                .shadow(color: scoreColor.opacity(0.3), radius: 4, x: 0, y: 2)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.1))
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    ScoreView(currentScore: 2, totalScore: 5)
}
