import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result: [Int] = []
    var releaseDay = 0
    for i in (0..<progresses.count) {
        let day = Int(ceil((Double(100 - progresses[i])) / Double(speeds[i])))
        if day > releaseDay {
            releaseDay = day
            result.append(1)
        } else {
            result[result.count-1] += 1
        }
    }
    
    return result
}