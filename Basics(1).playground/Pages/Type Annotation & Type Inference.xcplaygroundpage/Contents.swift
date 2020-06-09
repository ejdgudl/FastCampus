//: [Previous](@previous)
/*:
 # Type Annotation & Type Inference
 */
// 스위프트는 TypeSafty 한 언어
// 컴파일 앱을 실행시키기 전에 컴파일러가 오류를 잡아줌 (타입이 다르면 최대한 오류를 알려줌)
// 런타임 실젤 실행될때
/*:
 ---
 ## Type Annotation
 * 변수 선언 시 사용될 자료의 타입을 명확하게 지정하는 것
 ---
 */
let year: Int = 2019
// 타입 선언 동시 값 할당

let language: String
language = "Swift"
// 값 할당 나중에 가능

var red, green, blue: Double
red = 255.0
green = 150.123
blue = 75
 // 동시 선언 후 값 할당

/*:
 ---
 ## Type Inference
 * 변수 선언 시 초기화로 사용되는 값의 타입을 통해 변수의 타입을 추론하여 적용하는 것
 ---
 */
let name: String = "Tory"
type(of: name)
// String

let age: Int = 4
type(of: age)
// Int

var weight = 6.4
type(of: weight)
// Double

var isDog = true
type(of: isDog)
// Bool

//: [Next](@next)
