import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var termsType = [String]()
    var termsMonth = [String]()
    var result = [Int]()
    for j in terms{
        termsType.append(j.components(separatedBy: " ").first!)
        termsMonth.append(j.components(separatedBy: " ").last!)
    }
    let todayNumber = today.replacingOccurrences(of: ".", with: "").map { Int(String($0))! }
    let todayInt = todayNumber.reduce(0) { $0 * 10 + $1 }
    for i in 0..<privacies.count{
        var privaciesList = privacies[i].components(separatedBy:" ").first!
        var privaciesDate = privaciesList.components(separatedBy:".")
        let privaciesYear = Int(privaciesDate[0])!
        let privaciesMonth = Int(privaciesDate[1])!
        let privaciesDay = Int(privaciesDate[2])!
        var privaciesType = privacies[i].components(separatedBy:" ").last!
        if let x = terms.firstIndex(where: { $0.hasPrefix(privaciesType) }) {
            var addMonth = Int(terms[x].components(separatedBy: " ").last!)
            var newMonth = privaciesMonth + addMonth!
            var newYear = privaciesYear
            if newMonth > 12{
                if newMonth%12 == 0{
                    newYear += newMonth/12 - 1
                    newMonth = 12
                }else{
                    newYear += newMonth/12
                    newMonth = newMonth%12
                }
            }
            var newDate = newYear * 10000 + newMonth * 100 + privaciesDay
            if todayInt >= newDate{
                result.append(i+1)
            }   
        }
    }
    return result
}