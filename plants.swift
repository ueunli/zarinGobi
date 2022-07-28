/*
## 문제[50마일]
> 뽀야미가 팬지꽃을 관찰하고 있다. 한 손에 든 포켓북에는 [꽃송이를 꺾으면 하루씩 '줄기 - 꽃봉오리 - 모종' 순서대로 자라, 꺾은 날로부터 사흘 뒤에 원래대로 꽃이 만개한다.]고 쓰여 있다.
> 꽃송이를 꺾은 날을 '첫날'이라 할 때, 그로부터 며칠이 지났는지 입력하면 현재의 꽃 상태를 출력하는 함수를 만들어라.
*/

// 열거형으로 선언
enum flowerStatus: String {
    case dayOne = "꽃줄기"
    case dayTwo = "꽃봉오리"
    case dayThree = "꽃모종"
}
var flowerGrowthPoint: Int
func flowerStatusToday(flowerDays: flowerStatus) {
    print(flowerDays.rawValue)
}
flowerStatusToday(flowerDays: flowerStatus.dayTwo)


// 튜플로 선언
// let flowerStatus1 = ("꽃줄기", "꽃봉오리", "꽃모종")



// 꽃에 꽃송이가 없는 경우 0포인트
//var flowerStatusToday: flowerStatus
//var flowerGrowthPoint: Int
//var isFullFlower: Bool
//switch flowerStatusToday {
//case flowerStatus.dayOne, flowerStatus.dayTwo: isFullFlower = false
//case flowerStatus.dayThree: isFullFlower = true
//}
//if flowerStatusToday == flowerStatus.dayOne {
//    // flowerGrowthPoint 
//    // return flowerGrowthPoint
//}
//
//func flowerStatusToday(flowerStatusToday: Int) {
//    return flowerStatus.flowerStatusToday
//}
//switch flowerStatusToday {
//case flowerStatus.dayOne: flowerStatusToday = flowerStatus(rawValue: 0)
//case flowerStatus.dayTwo: flowerStatusToday = flowerStatus.dayTwo.rawValue
//case flowerStatus.dayThree: flowerStatusToday = flowerStatus.dayThree.rawValue
//}
