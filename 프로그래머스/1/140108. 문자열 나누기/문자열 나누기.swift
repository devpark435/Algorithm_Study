import Foundation

func solution(_ s:String) -> Int {
    var result = 0
    var remainingString = s
    
    while !remainingString.isEmpty {
        let x = remainingString.first!
        var countX = 1
        var countNotX = 0
        
        for char in remainingString.dropFirst() {
            if char == x {
                countX += 1
            } else {
                countNotX += 1
                if countX == countNotX {
                    result += 1
                    remainingString = String(remainingString.dropFirst(countX + countNotX))
                    break
                }
            }
        }
        
        if countX != countNotX {
            result += 1
            break
        }
    }
    
    return result
}