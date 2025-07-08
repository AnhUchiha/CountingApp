import SwiftUI

@main
struct CountingAppApp: App {
    @State private var gVM: GameViewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
//            MainView()
//                .environment(gVM)
            StartView()
        }
    }
}
