/*
 ## 문제[50마일]
 > 각 주민은 성격, 취미, 좋아하는 음악 등의 다양한 속성을 지닌다. 
 > 배열, 열거형, 네임드 튜플, 함수의 반환값 가짓수 등을 활용하여 주민들의 프로필을 요약하여 알려주는 코드를 작성하시오.
 */

/* 자투리 구상(당장은 쓸모 없지만 나중에 고려할 것 같은 정보를 나만의 용어로 정리)
 - 공유속성: 종, 성격, 취미, 좋아하는 음악, 좋아하는 색깔   //(스타일은 생략)
 - 고유속성: 이름, 말버릇, 생일, 아미보 번호
 ㄴ 자료형 연습을 위한 코드이므로 '공유속성' 일부만 활용할 것
*/


// 초기계획 ㄱ
// "이 섬에는 'Array'(많은순서1위까지) 등 총 'n'마리의 동물 주민이 살고 있습니다. '운동광' 성격을 가진 주민은 'Array', '노래' 취미를 가진 주민은 'Array'입니다."
// func listUpResidents(주민목록 residents: String...) -> (Array, Int) {} // 종족나열, 총 인원수
// func searchResidents() -> (String, String) {성격 personality: Personality, 취미 hobby: Hobby} //성격, 취미 검색
// fund askMyResidents() -> Void {} //첫함수 리턴1 0~2까지, 다른 리턴 3가지 가져와 문자열에 병합
//ㄴ 배열에서 요소별 개수 세기에서 막힘. 첫문장만 단순화하여 구현했다..






// 양식
typealias ResidentInfo = (종: Species, 성격: Personality, 취미: Hobby)
// ㄴ 고민기록: 네임드 튜플 대신 딕셔너리를 쓰기에는 key값 부분이 hashable하지 않으므로 부적절하다


// 종
enum Species: String {
    case dog = "개"
    case cat = "고양이"
    case rabbit = "토끼"
    case tiger = "호랑이"
    case bigBear = "큰곰"
    case babyBear = "아기곰"
}

// 성격
enum Personality: String {
    case rJoke = "운동광"
    case rBigSister = "단순활발"
    case rLazy = "먹보"  // `lazy`키워드 탓에 `r`접두사 통일
    case rPeppy = "아이돌"
    case rSweet = "친절함"
    case rSmug = "느끼함"
    case rCranky = "무뚝뚝"
    case rSnooty = "성숙함"
}

// 취미
enum Hobby: String {
    case education = "교육"
    case fashion = "패션"
    case fitness = "운동"
    case music = "음악"
    case nature = "자연"
    case play = "놀이"
}


// 간이 주민 목록
let 범호: ResidentInfo = (.tiger, .rJoke, .fitness)
let 아세로라: ResidentInfo = (.babyBear, .rPeppy, .fashion)
let 캐비어: ResidentInfo = (.cat, .rSweet, .education)
let 닌토: ResidentInfo = (.rabbit, .rJoke, .fitness)
let 제인: ResidentInfo = (.cat, .rSnooty, .fashion)
let 연유: ResidentInfo = (.bigBear, .rPeppy, .fashion)
let 네이아: ResidentInfo = (.bigBear, .rBigSister, .music)
let 미랑: ResidentInfo = (.rabbit, .rBigSister, .fitness)
let 토미: ResidentInfo = (.dog, .rLazy, .play)
// ㄴ 원래 전부 let선언으로만 쭉 작성했는데, 입력값으로 받은 문자열에 '문자열.종' 형태로 매칭이 불가하여 부득이 (그리 적합하지 않음을 앎에도) 연관값을 갖는 enum으로 작성하였다.
// ㄴ 고민기록: 주민 정보는 불변이므로 상수로 선언 (말버릇은 변하지만 배제했으므로 현재로선 고려x)
// ㄴ 고민기록: Struct를 공부한 뒤에 종/성격/취미별 동물 목록도 구현해 보고 싶다. 일단 Dictionary는 hashable 아니라 불가능(공유속성에 한하느라 모든 속성이 같은 주민 쌍이 있을 가능성)

var allSpecies = [String]()
for species in Species.allCases {
    allSpecies.append(species.rawValue)
}

//var allNames = [String]()
//for ResidentInfo in ResidentInfo {}
// ㄴ 네임드튜플 타입으로 정의된 상수들의 이름만 모을 순 없을까? 

// 종 검색
func askSpecies(_ residentName: ResidentInfo) -> String {
    guard allSpecies.contains(residentName.종.rawValue) else { return "새로운 종족입니다." }
    return residentName.종.rawValue
}
func listUpResidents(주민목록 residents: ResidentInfo...) -> (Array<ResidentInfo>, Array<String>, Int) {
    var myResidents = [ResidentInfo]()
    myResidents.append(contentsOf: residents)  //인풋타입을 String으로 하면 아래가 문제, ResidentInfo로 받으면 여기가 문제.
    var mySpecies = [String]()
    for resident in residents {
        mySpecies.append(resident.0.rawValue)
    }
    let mySpeciesSet = Set(mySpecies)
//    print(type(of: residents)) //여러 입력값을 받으면 배열로 인식
//    print(myResidents)
    
    //temp(임시로 중첩. 함수 분리 요망)
    let info1 = Array(mySpeciesSet)[0...1].joined(separator: ", ")      //Set으로 바뀌었다 Array로 돌아온 거라 random효과 有
    let info2 = myResidents.count
    let message = "이 섬에는 \(info1) 등 총 \(info2)마리의 동물 주민이 살고 있습니다."
    print(message)
    
    return (명단: myResidents, 서식종: Array(mySpeciesSet), 인구: myResidents.count) //반환값에서 네이밍튜플화 할 수 있구나!!
}

// 임시로 위 함수에 중첩
// func talkAboutResidents() {
//     let randomSpecies = listUpResidents().1[0...1].joined(separator: ", ")
//     let population = listUpResidents().2
//     print("이 섬에는 \(randomSpecies) 등 총 \(population)마리의 동물 주민이 살고 있습니다.")
// }



//실행문
listUpResidents(주민목록: 네이아, 닌토, 미랑, 범호)


