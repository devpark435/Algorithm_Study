import Foundation

func solution(_ park: [String], _ routes: [String]) -> [Int] {
    var park = park.map { Array($0) }
    var start = (0, 0)
    
    for i in 0..<park.count {
        if let j = park[i].firstIndex(of: "S") {
            start = (i, j)
            break
        }
    }
    
    let directions: [Character: (Int, Int)] = ["E": (0, 1), "S": (1, 0), "W": (0, -1), "N": (-1, 0)]
    
    for route in routes {
        let parts = route.split(separator: " ")
        let dir = parts[0].first!
        let steps = Int(parts[1])!
        
        let (dx, dy) = directions[dir]!
        let (newX, newY) = (start.0 + dx * steps, start.1 + dy * steps)
        
        if newX < 0 || newX >= park.count || newY < 0 || newY >= park[0].count {
            continue
        }
        
        let isObstacle = (0...steps).contains { step in
            let (x, y) = (start.0 + dx * step, start.1 + dy * step)
            return park[x][y] == "X"
        }
        
        if !isObstacle {
            start = (newX, newY)
        }
    }
    
    return [start.0, start.1]
}