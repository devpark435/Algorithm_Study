import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var honor = [Int]()
    var result = [Int]()
    for score in score{
        honor.append(score)
        honor = honor.sorted(by: >)
        if honor.count > k {
            honor.removeLast()
        }
        result.append(honor.last!)
    }
    return result
}