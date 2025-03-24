import Foundation

func solution(_ diffs:[Int], _ times:[Int], _ limit:Int64) -> Int {
     // 이진 탐색을 위한 범위 설정 (최소 숙련도 1부터 최대 난이도까지)
    let maxDifficulty = diffs.max() ?? 0
    var left = 1
    var right = maxDifficulty
    
    // 이진 탐색으로 최소 숙련도 찾기
    while left <= right {
        let mid = (left + right) / 2
        let totalTime = calculateTotalTime(diffs: diffs, times: times, level: mid)
        
        if totalTime <= limit {
            // 시간 내에 해결 가능하면 더 낮은 숙련도 시도
            right = mid - 1
        } else {
            // 시간 내에 해결 불가능하면 더 높은 숙련도 필요
            left = mid + 1
        }
    }
    
    return left
}

// 주어진 숙련도로 모든 퍼즐을 푸는데 필요한 시간 계산
func calculateTotalTime(diffs: [Int], times: [Int], level: Int) -> Int64 {
    var totalTime: Int64 = 0
    
    for i in 0..<diffs.count {
        let diff = diffs[i]
        let timeCur = times[i]
        let timePrev = i > 0 ? times[i-1] : 0
        
        if level >= diff {
            // 숙련도가 난이도보다 높거나 같으면 한 번에 해결
            totalTime += Int64(timeCur)
        } else {
            // 숙련도가 난이도보다 낮으면 여러 번 시도 필요
            let errors = diff - level
            totalTime += Int64(errors) * Int64(timeCur + timePrev) + Int64(timeCur)
        }
    }
    
    return totalTime
}