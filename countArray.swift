import Cocoa

// <profile>문제 파생 연구
// 배열 내 중복요소 개수 세기
/*
 발상1) .sorted(), 반복문으로 요소 = 다음요소 여부 판별 - 개수 세는 법까지는 아직 구상x
 발상2) 배열→세트→배열 변환하여 중복 없는 목록 생성, 요소별 Int변수 선언, 반복문으로 원본배열 요소들을 '접두사'로 가졌는지 하나씩 카운트
 */


var originalArray: Array<String> = ["영희", "철수", "민호", "영희", "민호", "수진", "민호"]

// 발상2 실험
var listedArray = Set(originalArray).sorted()

//var index: Int = 1
//for member in listedArray {
//    print("후보\(index): \(member)")
//    index += 1
//}

for numb in 0...listedArray.count - 1 {
    print(numb + 1, "-", listedArray[numb])
}

//typealias memberCount = (String, Int)
//var memberVar1: memberCount = (listedArray[0], 0)
//var memberVar2: memberCount = (listedArray[1], 0)
//var memberVar3: memberCount = (listedArray[2], 0)
//var memberVar4: memberCount = (listedArray[3], 0)

//var memberDict: Dictionary<String, Int> = [:]
//for member in listedArray {
//    memberDict.updateValue(0, forKey: member)
//}

typealias memberCount = (name: String, count: Int)
var memberTuples: Array<memberCount> = []
for member in listedArray {
    memberTuples.append((member, 0))
}

for name in originalArray {
    for numb in 0...listedArray.count - 1 {
        guard listedArray[numb] == name else { continue }
//        memberDict.updateValue(<#T##value: Int##Int#>, forKey: <#T##String#>)
        memberTuples[numb].1 += 1
    }
    // 중첩반복문이지만 여기엔 별다른 작업이 없는 게 걸린다. 안팎을 뒤집어(originalArray 루프를 안에서) 작성했다면 어땠을까? 더 복잡했을까?
}


print(memberTuples)


for index in 0...memberTuples.count - 1 {
    print(memberTuples[index].0, "x", memberTuples[index].1)
}

// 위와 같은 코드(튜플 바인딩 연습 겸 작성). 길지만 주관적으로 가독성은 낫다.
for index in 0...memberTuples.count - 1 {
    let (이름, 명수) = memberTuples[index]
    print("\(이름): 총 \(명수)표")
}



/* 돌아보기
Swift 컬렉션을 막상 실제 논리에 써먹으려니 막히는 부분이 많았다. 당연히 있을 줄 알았는데 없고, 돌고 돌아 풀어도 탐탁찮거나 아예 방법을 못 찾은 경우도 있었다.
예를 들어, 배열에서 '중복값을 제거' 할 수는 있지만 '중복 횟수 세기'에서 막혔고,
Int타입 value를 가지는 딕셔너리를 반복문 내부에서 연산자로 묶어 처리해 보겠다는 황당무계한 생각으로 덤볐다가 시간을 버리기도 했다...
 (↑ for index in 딕셔너리 { 딕셔너리.updateValue(??? += 1), 임시상수 } )
1차적 원인은 나의 무지이지만, 시간이 지나면 2차적 원인인 '기본기능 의존'이 도질지도 모른다.
아는 메서드와 프로퍼티가 많아져도, 내가 원하는 기능을 '직접적으로' 구현해줄 딱 맞는 요소가 항상 있지는 않을 것이다.
지금은 지식을 넓히는 단계지만, 그 과정에서 아는 것을 엮고 되짚으며 '활용'하는 습관을 들여야겠다.
*/