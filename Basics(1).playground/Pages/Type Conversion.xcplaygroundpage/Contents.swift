//: [Previous](@previous)
/*:
 # Type Conversion
 */

let height = Int8(5)
let width = 10
//let area = height * width
//print(area) // error 다른 타입과 연산은 불가능


let h = Int8(12)
//let x = 10 * h
//print(x) // 120


/*:
 ---
 ## Question
 - 8번째 라인 let area = height * width  부분은 에러가 발생하고
 - 13번째 라인 let x = 10 * h 에서는 에러가 발생하지 않는 이유는?
 ---
 */
// 타입추론



let num = 10
let floatNum = Float(num)
type(of: floatNum) // Float

let signedInteger = Int(floatNum)
type(of: signedInteger) // Int

let str = String(num)
type(of: str) // String


//: [Next](@next)
