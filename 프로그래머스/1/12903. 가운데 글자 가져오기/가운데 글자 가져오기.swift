func solution(_ s: String) -> String {
    let middle = s.index(s.startIndex, offsetBy: (s.count - 1) / 2)
    let isEven = s.count % 2 == 0
    return isEven ? String(s[middle...s.index(after: middle)]) : String(s[middle])
}
