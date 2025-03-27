import Foundation

func solution(_ points:[[Int]], _ routes:[[Int]]) -> Int {
    // 포인트 번호를 좌표로 매핑
    let pointCoords = Dictionary(uniqueKeysWithValues: points.enumerated().map { ($0.offset + 1, ($0.element[0], $0.element[1])) })
    
    // 각 시간별 각 위치의 로봇 수
    var timePositionCounts = [Int: [String: Int]]()
    
    // 각 로봇별 경로 계산
    for route in routes {
        var time = 0
        
        // 각 구간별 경로 계산
        for i in 0..<(route.count - 1) {
            let startPoint = pointCoords[route[i]]!
            let endPoint = pointCoords[route[i + 1]]!
            
            // 시작 위치 기록 (첫 번째 지점만)
            if i == 0 {
                let posKey = "\(startPoint.0),\(startPoint.1)"
                timePositionCounts[time, default: [:]][posKey, default: 0] += 1
            }
            
            // 다음 포인트까지 이동
            var (r, c) = startPoint
            
            while (r, c) != endPoint {
                time += 1
                
                // r 좌표 먼저 변경
                if r < endPoint.0 {
                    r += 1
                } else if r > endPoint.0 {
                    r -= 1
                // r 좌표가 같으면 c 좌표 변경
                } else if c < endPoint.1 {
                    c += 1
                } else if c > endPoint.1 {
                    c -= 1
                }
                
                // 현재 위치 기록 (마지막 포인트 포함)
                let posKey = "\(r),\(c)"
                timePositionCounts[time, default: [:]][posKey, default: 0] += 1
            }
        }
    }
    
    // 위험 상황 카운트
    var dangerCount = 0
    
    for (_, positions) in timePositionCounts {
        for (_, count) in positions {
            if count >= 2 {
                dangerCount += 1
            }
        }
    }
    
    return dangerCount
}