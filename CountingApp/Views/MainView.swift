import SwiftUI

struct MainView: View {
    @Environment(GameViewModel .self) var gVM
    
    var body: some View {
        VStack {
            Text("Counting App !")
            
            Button {
                gVM.correctSound()
            } label: {
                Image(systemName: "checkmark.seal.fill")
            }
            .font(.title)
            .padding()

            Button {
                gVM.incorrectSound()
            } label: {
                Image(systemName: "xmark.seal.fill")
            }
            .font(.title)
        }
        .padding()
    }
}

#Preview {
    MainView()
        .environment(GameViewModel())
}
