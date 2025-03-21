import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    var answer = 0
    var q = [Int]()
    
    for t in 0..<24 {
        while !q.isEmpty && q[0] <= t {
            q.removeFirst()
        }
        
        let required = players[t] / m
        
        if required > q.count {
            let expansion = required - q.count
            answer += expansion
            
            for _ in 0..<expansion {
                q.append(t + k)
            }
        }
    }
    
    return answer
}