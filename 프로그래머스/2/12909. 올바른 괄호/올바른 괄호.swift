import Foundation

func solution(_ s:String) -> Bool
{
    var brackets: [Character:Character] = [")":"("]
    var stack = [Character]()
    
    for char in s {
        if let openBracket = brackets[char] {
            if stack.isEmpty || stack.last != openBracket {
                return false
            }
            
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    
    return stack.isEmpty
}