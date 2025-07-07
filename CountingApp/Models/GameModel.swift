import Foundation

struct GameModel{
    var score: Int
    let maxTurns: Int
    var volumes: Float
    var turns: Int
    var answer: Int
    var alternatives: [Int]
    var gameWin: Bool{
        turns >= maxTurns
    }
    
    var gameOver: Bool{
        score < 0 && gameWin
    }
    
    mutating func increaseScore(){
        score += 1
    }
    
    mutating func nextTurn(){
        turns += 1
    }
    
    mutating func generateNewProblem(){
        alternatives = Int.generateUniqueRandomInt(count: 4)
        //create array of 4 different random values between 0 to 99
        
        answer = alternatives[alternatives.count - 1]
        
        alternatives = alternatives.shuffled()
        //mix values
    }
    
    static var defaultGame: GameModel{
        .init(score: 0, maxTurns: 5, volumes: 0.7, turns: 0, answer: 10, alternatives: Int.generateUniqueRandomInt(count: 4).shuffled())
    }
}
