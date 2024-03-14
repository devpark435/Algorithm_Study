import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var result = 0
    
    (1...number).forEach { num in
        var divisorCount = 0
        let numSqrt = sqrt(Double(num))
        let sqrt = Int(numSqrt)
        
        for i in 1...sqrt {
            if num % i == 0 {
                divisorCount += 1
                if i != num / i {
                    divisorCount += 1
                }
            }
        }
        
        result += (divisorCount > limit ? power : divisorCount)
    }
    
    return result
}