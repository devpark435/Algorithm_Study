import Foundation

func solution(_ s:String) -> [Int] {
    let charList = s.map{String($0)}
    var answer:[Int] = []
    for i in 0..<charList.count{
        var index = i
        var isFirst = true
        while(index>0){
            index -= 1
            if charList[index] == charList[i]{
                answer.append(i - index)
                isFirst = false
                break
            }
        }
        if isFirst == true{
            answer.append(-1)
        }
    }
    return answer
}