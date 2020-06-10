//: [Previous](@previous)
/*:
 # Optionals
 */
/*:
 ---
 ### Question
 - 값이 0인 것과 없는 것의 차이는?  (Empty vs Valueless)
 ---
 */
// 옵셔널은 아예 없을수도 있다라는 걸 말해주고싶을때 사용
// 0은 하나의 값

// 없는건 아예 없는거
/*:
 ![optional](0vsNULL.jpg)
 */



/*:
 ---
 ## Optional
 * Optional 은 값이 없을 수 있는(absent) 상황에 사용
 * Objective-C 에는 없는 개념
 * 옵셔널 타입은 2가지 가능성을 지님
   - 값을 전혀 가지고 있지 않음
   - 값이 있으며, 그 값에 접근하기 위해 옵셔널을 벗겨(unwrap)낼 수 있음
 ---
 */


let possibleNumber = "123"
var convertedNumber = Int(possibleNumber)
type(of: convertedNumber)
// Optional(Int)
// 예를 들어 Hello를 Int로 바꿀수 없기 때문에

//type(of: Int("123")) Optional(Int)
//type(of: Int(3.14)) // Int
//type(of: Int(3)) // Int



//: [Next](@next)
