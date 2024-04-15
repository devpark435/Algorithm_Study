import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = priorities.enumerated().map { ($0, $1) }
    var count = 0
    
    while !queue.isEmpty {
        let currentItem = queue.removeFirst()
        
        if queue.contains(where: { $0.1 > currentItem.1 }) {
            queue.append(currentItem)
        } else {
            count += 1
            if currentItem.0 == location {
                return count
            }
        }
    }
    
    return count
}