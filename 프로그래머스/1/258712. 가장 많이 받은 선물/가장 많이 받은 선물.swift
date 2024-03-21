import Foundation

func solution(_ friends: [String], _ gifts: [String]) -> Int {
    var map = [String: Int]()
    for (i, friend) in friends.enumerated() {
        map[friend] = i
    }
    
    var index = [Int](repeating: 0, count: friends.count)
    var record = [[Int]](repeating: [Int](repeating: 0, count: friends.count), count: friends.count)
    
    for gift in gifts {
        let cur = gift.components(separatedBy: " ")
        let from = cur[0]
        let to = cur[1]
        
        index[map[from]!] += 1
        index[map[to]!] -= 1
        record[map[from]!][map[to]!] += 1
    }
    
    var ans = 0
    for i in 0..<friends.count {
        var cnt = 0
        for j in 0..<friends.count {
            if i == j { continue }
            if record[i][j] > record[j][i] {
                cnt += 1
            } else if record[i][j] == record[j][i] && index[i] > index[j] {
                cnt += 1
            }
        }
        ans = max(cnt, ans)
    }
    
    return ans
}