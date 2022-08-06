/*
 ## 문제[50마일]
 > 얻을 수 있는 채소의 개수를 구하라. 아래는 채소의 성장 기준이다. 
 > - 3일째에 열림
 > - 1일1회 물 주면 열리는 개수 +1
 > - 주의) 하루 내에 여러 번 주면 무효
 > - 즉, 1또는2일째에 물 1회 줬다면 2개씩, 1그리고2일째에 물 1회씩(총2회) 줬다면 3개씩 수확
 */



//물주기 기록 저장공간
var waters: (dayOne: Int, dayTwo: Int) = (0, 0)
var watered: (dayOne: Bool, dayTwo: Bool) = (false, false)
var waterPoint: Int = 0

func waterDayOne() {
    waters.dayOne += 1
}
func waterDayTwo() {
    waters.dayTwo += 1
}

func checkWaters(_waterRecords: (Int, Int) = waters) -> (Bool, Bool) {
    
  //// 튜플 where절과 상수 바인딩 ㄱ
  //  switch waters {
  //      case let (one, two) where one >= 1:
  //          watered.dayOne = true
  //          fallthrough
  //      case let (_, two) where two >= 1:
  //          watered.dayTwo = true
  //      default: break
  //  }
  
  // 2안 ㄱ
    switch waters {
        case (0, 0): watered = (false, false) //break
        case (_, 0): watered = (true, false)  //watered.dayOne = true
        case (0, _): watered = (false, true)  //watered.dayTwo = true
        default: watered = (true, true)       //case (1이상, 1이상)
    }
    
    return watered
}

func sumWaterPoint(_waterRecord: ((Int, Int)) -> (Bool, Bool) = checkWaters) -> Int {
    if watered.dayOne {
        waterPoint += 1
    }
    if watered.dayTwo {
        waterPoint += 1
    }
    return waterPoint
}

enum vegetableStatus: Int {
    case 한개
    case 두개
    case 세개
}

func showMyVegetables(_ getWaterPoint: (((Int, Int)) -> (Bool, Bool)) -> Int = sumWaterPoint) {
    var shape = "___"
    guard let status = vegetableStatus(rawValue: waterPoint) else { return }
    switch status {
        case .한개: shape = "_i_"
        case .두개: shape = "i_i"
        case .세개: shape = "iii"
    }
    print("\(status):", shape)
}



/// 간이 실행부 🛑
///
waterDayOne()
waterDayTwo()
    print(waters, watered, waterPoint)

checkWaters()
    print(waters, watered, waterPoint)

sumWaterPoint()
    print(waters, watered, waterPoint)

showMyVegetables()
    print(waters, watered, waterPoint)


