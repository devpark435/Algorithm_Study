func solution(_ arr:[Int]) -> [Int] {
    var result = arr
    if let minValue = arr.min(), let index = result.firstIndex(of: minValue) {
        result.remove(at: index)
    }
    return result.isEmpty ? [-1] : result
}