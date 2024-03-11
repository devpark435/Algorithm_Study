import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let patterns = [[1, 2, 3, 4, 5],
                    [2, 1, 2, 3, 2, 4, 2, 5],
                    [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]
    let patternLengths = patterns.map(\.count)

    var scores = [Int: Int]()

    for i in 0..<answers.count {
        for (student, pattern) in patterns.enumerated() {
            let index = i % patternLengths[student]
            if pattern[index] == answers[i] {
                scores[student + 1] = (scores[student + 1] ?? 0) + 1
            }
        }
    }

    let maxScore = scores.values.max()!
    return scores.filter { $0.value == maxScore }.sorted { $0.key < $1.key }.map { $0.key }
}