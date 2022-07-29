/*
 ## 문제[50마일]
 > 너굴포트에서는 1일 1회 출석 마일리지를 받을 수 있다.
 > 연속 1일부터 7일까지 순서대로 '50-80-100-150-200-300'마일을 지급한다.
 > 리얼타임 유저(어제로 타임슬립하지 않음)라고 가정할 때, 지급되는 마일리지를 계산하는 함수를 만들어라. 
 */

// 구상: 전날 접속 여부에 따라 '출석점수'가 리셋 혹은 더해지는 함수1, 
// 오늘의 '출석점수'를 확인하여 그에 따른 마일리지를 알려주는 함수2를 만들자.

var dailyAttendancePoint: Int = 0

// '전날 접속 여부'를 저장하는 Bool타입 변수를 만들까 하다가, 현 '출석점수'가 0이면 곧 '전날 미접속'이란 뜻이니 필요 없으리라 생각
var dailyAttendance: Bool = false
// ...이 아니었다. 전날 미접속이면 (실제 게임상으로는 됐겠지만)출석점수 초기화가 아직 이루어지지 않은 상태이니 판별이 필요하다.
// 마지막 접속일자와 현 접속일자가 1일보다 크면 false로 하는 로직을 만들까 하지만, 지금은 간이 코드 연습이 목적이니 단순화하자. 이건 자동으로 판별된..아니 각자 양심고백 한다고 하자.

func attendanceTracker(yesterday dailyAttendance: inout Bool) {
    guard dailyAttendance else { dailyAttendancePoint == 1; return }
    dailyAttendancePoint += 1
}

var dailyBonusMileage: Int = 0

func attendancePointer() -> Int {
    switch dailyAttendancePoint {
    case 1: dailyBonusMileage = 50
    case 2: dailyBonusMileage = 80
    case 3: dailyBonusMileage = 100
    case 4: dailyBonusMileage = 150
    case 5: dailyBonusMileage = 200
    case 6: dailyBonusMileage = 250
    case 7...: dailyBonusMileage = 300
    default: dailyBonusMileage = 0 //디폴트값을 뭘로 할지 못 정하겠다
    }
    print("하루에 한 번 너굴포트 접속 보너스 마일을 드립니다. (\(dailyAttendancePoint)일째: \(dailyBonusMileage)마일)")
    return dailyBonusMileage
}

// 왜 자꾸 구체적인 근거 없이 열거형이나 튜플을 써먹고 싶을까?
// 7일 이상이면 '7일째'가 아니라 '7일 이상'이라고 출력해야 하지만, 분기는 나중에...
// 실무를 모르지만 혹시 이렇게 해두면 나중에 쓸모 있지 않을까?라는 생각에 뭔가 자꾸 추가하고 싶어진다.
// 예를 들면 멘트창 띄우기용 print값과 다른 메서드에서 받아쓸 것을 대비한 Int형 그대로의 반환값 2가지를 나눠 쓴 것 등등

// 실행 ㄱ
attendanceTracker(yesterday: true)
attendancePointer()
// attendancePointer()함수에 switch문이 최선인가 하는 생각이 남아있기 때문에 두 함수 중첩은 미루기로 했다. 
// 새로 배운 inout파라미터를 써먹고 싶었는데, '변경할 수 없는 값을 inout 인수로 전달할 수 없습니다. literals are not mutable'이라는 오류가 떠서 생각 중이다.
// 그냥 제거하면 되지만, 일단은 오류메시지의 의미를 이해해보고 싶어서 이것도 미뤄보기로 했다. 