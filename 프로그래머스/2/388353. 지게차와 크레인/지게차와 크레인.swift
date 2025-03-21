import Foundation

func solution(_ storage:[String], _ requests:[String]) -> Int {
    
    var grid = storage.map { $0.map { $0 } }
    let rows = grid.count
    let cols = grid[0].count
    
    for request in requests {
        let targetType = request.first!
        
        if request.count == 2 {
            for i in 0..<rows {
                for j in 0..<cols{
                    if grid[i][j] == targetType {
                        grid[i][j] = "."
                    }
                }
            }
        } else {
            
            var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
            var queue = [(Int, Int)]()
            
            for i in 0..<rows {
                for j in 0..<cols {
                    if grid[i][j] == "." && (i == 0 || i == rows-1 || j == 0 || j == cols-1) {
                        queue.append((i, j))
                        visited[i][j] = true
                    }
                }
            }
            
            let directions = [(0,1),(1,0),(0,-1),(-1,0)]
            var index = 0
            
            while index < queue.count {
                let (i, j) = queue[index]
                index += 1
                
                for (di, dj) in directions {
                    let ni = i + di
                    let nj = j + dj
                    
                    if ni >= 0 && ni < rows && nj >= 0 && nj < cols && !visited[ni][nj] && grid[ni][nj] == "." {
                        queue.append((ni, nj))
                        visited[ni][nj] = true
                    }
                }
            }
            
            var accessibleContainers = [(Int,Int)]()
            
            for i in 0..<rows {
                for j in 0..<cols {
                    if grid[i][j] == targetType {
                        for (di, dj) in directions {
                            let ni = i + di
                            let nj = j + dj
                            
                            if ni < 0 || ni >= rows || nj < 0 || nj >= cols || (grid[ni][nj] == "." && visited[ni][nj]) {
                                accessibleContainers.append((i, j))
                                break
                            }
                        }
                    }
                }
            }
            
            for (i,j) in accessibleContainers {
                grid[i][j] = "."
            }
                
        }
    }
    //남은 컨테이너 수
    let aliveContainers = grid.flatMap { $0 }.filter { $0 != "." }
    print(aliveContainers)
    return aliveContainers.count
}