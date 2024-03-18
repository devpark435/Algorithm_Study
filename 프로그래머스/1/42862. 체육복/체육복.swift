import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var reserveStudent = reserve.filter { !lost.contains($0) }.sorted()
    var lostStudent = lost.filter { !reserve.contains($0) }
    var lostStudentCount = lostStudent.count
    for i in reserveStudent {
        if let i = lostStudent.index(of:i-1){
            lostStudent.remove(at:i)
        }else if let i = lostStudent.index(of:i+1){
            lostStudent.remove(at:i)
        }
    }
    return n - lostStudent.count
}