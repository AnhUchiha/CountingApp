extension Int{
    static func generateUniqueRandomInt(count: Int, lower: Int = 0, upper: Int = 99) -> [Int]{
        if count > upper - lower + 1 || lower > upper{
            return []
        }
        
        var result = [Int]()
        
        while result.count < count {
            let randomValue = Int.random(in: lower...upper)
            if !result.contains(randomValue){
                result.append(randomValue)
            }
        }
        
        return result
    }
}
