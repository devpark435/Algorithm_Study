import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var wordSet = Set<String>()
    var lastChar = words[0].first!

    for (index, word) in words.enumerated() {
        if !wordSet.isEmpty && (wordSet.contains(word) || lastChar != word.first) {
            return [(index % n) + 1, index / n + 1]
        }
        wordSet.insert(word)
        lastChar = word.last!
    }
    return [0, 0]
}
