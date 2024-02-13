func solution(_ s:String) -> String {
    var array = s.split(separator: " ").map{Int($0)!}.sorted(by: <)
    return "\(array.first!) \(array.last!)"
}