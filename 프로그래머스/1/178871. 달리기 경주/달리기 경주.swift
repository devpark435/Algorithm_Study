import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var rank = Dictionary(uniqueKeysWithValues: zip(players, players.indices))
    var players = players
    for calling in callings { 
        let index = rank[calling]!  
        let player = players[index-1]
        
        rank[calling]! -= 1        
        rank[players[index-1]]! += 1
        
        players.swapAt(index, index-1)
    }

    return players
}
 // var result = players
    // for call in callings{
    //     var index = result.firstIndex(of: call)!
    //     var temp = result[index - 1]
    //     result[index - 1] = result[index]
    //     result[index] = temp
    // }
    // return result