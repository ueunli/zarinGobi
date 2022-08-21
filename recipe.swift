/*
## 문제[50마일]
> 레시피를 구조체로 간단하게 구현하고, 
> 레시피를 배웠을 때 알림메시지를 출력하는 코드를 작성하시오.
*/

struct Recipe {

  let name: String
  let ingredients: [(String, Int)]
  
	var learned: Bool = false {
		didSet {
			print("\(self.name)을(를) 배웠다!")
		}
	}

  init(name: String, ingredients: [(String, Int)]) {
    self.name = name
    self.ingredients = ingredients
  }
  
}


//레시피 데이터 등록(생성)
var 엉성한도끼 = Recipe(name: "엉성한 도끼", ingredients: [("나뭇가지", 5), ("돌", 1)])

//레시피 배우기
엉성한도끼.learned = true




// 추가 구현 요망 ㄱ
// 레시피의 타입, 시리즈, '이미 배운 레시피야' 출력 코드