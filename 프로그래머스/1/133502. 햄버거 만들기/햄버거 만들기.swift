import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var ingredientStack = [Int]()
    let recipe = [1,2,3,1]
    var result = 0
    for i in ingredient{
        ingredientStack.append(i)
        
        if Array(ingredientStack.suffix(4)) == recipe {
            ingredientStack.removeLast(4)
            result += 1
        }
    }
    return result
}