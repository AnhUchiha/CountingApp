import SwiftUI

struct SettingView: View {
    @Environment(GameViewModel.self) var gVM
    @Binding var showSettingView: Bool
    @State var volume: Float
    
    var body: some View {
        NavigationStack {
            VStack{
                Form{
                    Section {
                        VStack(alignment: .leading){
                            Text("Volume")
                            Slider(value: $volume, in: 0...1, step: 0.1)
                        }
                    } header: {
                        Text("Audio Setting")
                    }
                }
                
                Button {
                    self.gVM.gameModel.volumes = volume
                    showSettingView.toggle()
                } label: {
                    Text("Save")
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Setting")
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }

        }
    }
}

#Preview {
    SettingView(showSettingView: .constant(false), volume: 0.7)
        .environment(GameViewModel())
}
