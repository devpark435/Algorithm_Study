import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var result = 0
    var sections = section
    
    var last = sections.first! + m - 1
    
    while !sections.isEmpty {
        result += 1
        for sec in sections {
            if last < sec {
                last = sections.first! + m - 1
                break
            } else {
                sections.removeFirst()
            }
        }
    }
    return result
}