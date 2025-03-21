import Foundation

func solution(_ info:[[Int]], _ n:Int, _ m:Int) -> Int {
    var states = Set<[Int]>()
    states.insert([0,0])
    
    for item in info {
        let traceA = item[0]
        let traceB = item[1]
        
        var newState = Set<[Int]>()
        
        for state in states {
            let aTrace = state[0]
            let bTrace = state[1]
            
            if aTrace + traceA < n {
                newState.insert([aTrace + traceA,bTrace])
            }
            
            if bTrace + traceB < m {
                newState.insert([aTrace,bTrace + traceB])
            }
        }
        
        states = newState
        
    }
    
    var minTrace = Int.max
        
    for state in states {
        minTrace = min(minTrace, state[0])
    }

    return minTrace == Int.max ? -1 : minTrace
}