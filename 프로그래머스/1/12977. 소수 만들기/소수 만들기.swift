import Foundation
//소수 판별 알고리즘
func isPrime(_ n: Int) -> Bool {
    for i in 2..<n {
        if n % i == 0 {
            return false
        }
    }
    return true
}

func solution(_ nums:[Int]) -> Int {
    var result = 0

    for i in 0..<nums.count - 2 {
        for j in i + 1..<nums.count - 1 {
            for k in j + 1..<nums.count {
                let sum = nums[i] + nums[j] + nums[k]
                if isPrime(sum) {
                    result += 1
                }
            }
        }
    }

    return result
}
