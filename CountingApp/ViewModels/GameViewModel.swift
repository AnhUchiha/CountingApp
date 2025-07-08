import Foundation
import Observation
import AVFoundation

@Observable
class GameViewModel{
    var gameModel: GameModel = .defaultGame
    var audioPlayer: AVAudioPlayer?
    
    private func playSound(name: String, ext: String = "caf"){
        guard let soundURL = Bundle.main.url(forResource: name, withExtension: ext)
        else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = gameModel.volumes
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func correctSound(){
        playSound(name: "correct")
    }
    
    func incorrectSound(){
        playSound(name: "incorrect")
    }
    
    func playNumber(num: Int){
        
    }
}

