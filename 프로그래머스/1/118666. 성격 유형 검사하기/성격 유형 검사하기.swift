import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var score = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A":0, "N": 0]
    var result = ""
    
    for i in 0..<survey.count {
        let first = String(survey[i].first!)
        let last = String(survey[i].last!)
        
        switch choices[i] {
        case 1...3:
            score[first]! += (4 - choices[i])
        case 5...7:
            score[last]! += (choices[i] - 4)
        default:
            score[last]! += 0
            // break
        }
    }

    score["R"]! >= score["T"]! ? result.append("R") : result.append("T")
    score["C"]! >= score["F"]! ? result.append("C") : result.append("F")
    score["J"]! >= score["M"]! ? result.append("J") : result.append("M")
    score["A"]! >= score["N"]! ? result.append("A") : result.append("N")
    return result
}