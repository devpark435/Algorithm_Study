import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    let maxLength = sizes.flatMap { $0 }.max() ?? 0
    let minLength = sizes.map{ $0.min() ?? 0 }.max() ?? 0
    return maxLength * minLength
}