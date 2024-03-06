import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var emptyBottle = n
    var result = 0

    while emptyBottle >= a{
        result += (emptyBottle / a) * b
        emptyBottle = emptyBottle - (emptyBottle / a * a) + ((emptyBottle / a) * b)
    }
    return result

}