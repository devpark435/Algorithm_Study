import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let filtered = "abcdefghijklmnopqrstuvwxyz".filter { !skip.contains($0) }.map { $0 }
    
    return String(s.map { char in
        if let idx = filtered.firstIndex(of: char) {
            let newIndex = (idx + index) % filtered.count
            return filtered[newIndex]
        } else {
            return char
        }
    })
}