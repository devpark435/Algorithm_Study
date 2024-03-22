import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var desktop = wallpaper.map{$0.map{$0}}
    var x = [Int]()
    var y = [Int]()
    for i in 0..<desktop.count{
        for j in 0..<desktop[i].count{
            if desktop[i][j]=="#"{
                x.append(i)
                y.append(j)
            }
        }
    }
    return [x.min()!,y.min()!,x.max()!+1,y.max()!+1]
}