import Foundation

func solution(_ n:Int, _ q:[[Int]], _ ans:[Int]) -> Int {
    // 1부터 n까지의 숫자 중 5개를 선택하는 모든 조합 중 조건을 만족하는 것을 찾음
    return findValidCombinations(from: 1, current: [], n: n, attempts: q, responses: ans)
}

// 시도한 숫자와 현재 조합 간의 일치 개수를 계산하는 함수
func countMatches(attempt: [Int], secretCode: [Int]) -> Int {
    return attempt.filter { secretCode.contains($0) }.count
}

// 가능한 조합을 생성하고 검증하는 함수
func findValidCombinations(from start: Int, current: [Int], n: Int, attempts: [[Int]], responses: [Int]) -> Int {
    // 5개 숫자가 모두 선택되었을 때
    if current.count == 5 {
        // 모든 시도에 대해 검증
        for i in 0..<attempts.count {
            let expectedMatches = responses[i]
            let matches = countMatches(attempt: attempts[i], secretCode: current)
            
            // 일치 개수가 다르면 이 조합은 유효하지 않음
            if matches != expectedMatches {
                return 0
            }
        }
        
        // 모든 검증을 통과하면 유효한 조합
        return 1
    }
    
    // 아직 5개를 다 선택하지 않았으면 조합 계속 생성
    var validCount = 0
    if start <= n {
        for i in start...n {
            var newCombination = current
            newCombination.append(i)
            validCount += findValidCombinations(
                from: i + 1, 
                current: newCombination, 
                n: n, 
                attempts: attempts, 
                responses: responses
            )
        }
    }
    
    return validCount
}