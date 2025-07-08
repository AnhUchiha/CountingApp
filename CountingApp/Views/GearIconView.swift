import SwiftUI

struct GearIconView: View {
    @Binding var showSettingView: Bool
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    withAnimation {
                        showSettingView.toggle()
                    }
                }, label: {
                    Image(systemName: showSettingView ? "gearshape.fill" : "gearshape")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                    .padding()
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    GearIconView(showSettingView: .constant(false))
}
