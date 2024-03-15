import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let zeroCount = lottos.filter { $0 == 0 }.count
    let matchCount = lottos.filter { win_nums.contains($0) }.count
    
    return [min(7-matchCount-zeroCount,6), min(7-matchCount,6)]
}