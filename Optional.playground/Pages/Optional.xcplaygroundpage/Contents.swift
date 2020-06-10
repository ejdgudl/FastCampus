//: [Previous](@previous)
/*:
 ---
 ## Optional Type Declaration
 ---
 */
// 옵셔널 타입 선언
/*
 var <#variable name#>: <#Type?#>
 var <#variable name#>: <#Optional<Type>#>
 */

var optionalType1: String?   // 기본값이 nil로 자동 초기화
var optionalType2: Optional<Int> = nil   // 수동 초기화. (값 또는 nil) 이 방법은 별로 쓰지 않음

optionalType1
type(of: optionalType1)// Optional<String>
type(of: optionalType2)// Optional<Int>


// Valueless state - nil

var optionalIntInit = Optional<Int>(0) // 0
var optionalInt: Int? = 0 // Optional<0>
type(of: optionalInt) //Optional<Int>

optionalInt = nil
optionalInt


// Optional -> NonOptional

//var nonOptional1 = nil
//var nonOptional2: Int = nil
//var nonOptionalType: Int = optionalInt



// Optional <- NonOptional

let nonOptional = 1
optionalInt = nonOptional
optionalInt = 100
// 옵셔널은 값이 있거나 없거나고
// 논 옵셔널은 값이 있다이다


// Optional -> NonOptional (X)
// Optional <- NonOptional (O)

// 각 타입이 가질 수 있는 값의 범위
// var nonOptionalNumber: Int    // 정수
// var optionalNumber: Int?      // 정수 or nil

// 가질수 있는 값이 서로 다르다


/*:
 ---
 ## Optional Biding and Forced Unwrapping
 ---
 */
// 옵셔널 언래핑


var convertedNumber: Int? = 123

if convertedNumber != nil {
  // warning + Optional(123)
  print("convertedNumber has an integer value of \(convertedNumber).")
}
// 명확하게 값이 있다라는걸 알려주게끔 언래핑을 해줘야한다

/*:
 ---
 ### Optional Binding
 ---
 */
print("\n---------- [ Optional Binding ] ----------\n")
/*
 if let <#nonOptional#> = <#OptionalExpression#> {
   <#Code#>
 }
 while let <#nonOptional#> = <#OptionalExpression#> {
   <#Code#>
 }
 guard let <#nonOptional#> = <#OptionalExpression#> else {
   <#Code#>
 }
 */


let someValue = "100"

if let number = Int(someValue) {
  print("\"\(someValue)\" has an integer value of \(number)")
} else {
  print("Could not be converted to an integer")
}
// true


// Optional Binding

var optionalStr: String? = "Hello, Optional"
print(optionalStr)

if let optionalStr = optionalStr {
  print(optionalStr)
} else {
  print("valueless string")
}



// 여러 개의 옵셔널 바인딩과 불리언 조건을 함께 사용 가능
if let firstNumber = Int("4"),
  let secondNumber = Int("42"),
  firstNumber < secondNumber,
  secondNumber < 100 {
  print("\(firstNumber) < \(secondNumber) < 100")
}

// 위와 동일한 동작
if let firstNumber = Int("4") {
  if let secondNumber = Int("42") {
    if firstNumber < secondNumber, secondNumber < 100 {
      print("\(firstNumber) < \(secondNumber) < 100")
    }
  }
}


/*:
 ---
 ### Forced Unwrapping
 ---
 */
// 반드시 값이 있다라고 컴파일러에게 알려주는 방법

/*
 let nonOptional = <#OptionalExpression!#>
 */

print("\n---------- [ Forced Unwrapping ] ----------\n")

if convertedNumber != nil {
//  print("convertedNumber has an integer value of \(convertedNumber).")
  print("convertedNumber has an integer value of \(convertedNumber!).")
}

print(convertedNumber)
print(convertedNumber!)


// Forced unwrap of nil value

convertedNumber = nil
convertedNumber
//convertedNumber! // nil일때 ! 붙이면 error


/*:
 ## IUO (Implicitly Unwrapped Optionals)
 */

// Optional
let possibleString: String? = "An optional string."
//let forcedString: String = possibleString  // Error
let forcedString: String = possibleString!
type(of: possibleString)
type(of: forcedString)


// Implicitly Unwrapped Optional
// Non Optional 타입인 것처럼 함께 사용 가능
var assumedString: String! = "An implicitly unwrapped optional string."
let stillOptionalString = assumedString
type(of: assumedString)
type(of: stillOptionalString)
print(assumedString)
print(assumedString!)

let implicitString: String = assumedString
type(of: implicitString)

//assumedString = nil
//print(assumedString!)


/*
 - 추후 어느 순간에서라도 nil 이 될 수 있는 경우에는 이 것을 사용하지 말아야 함
 - nil value 를 체크해야 할 일이 생길 경우는 일반적인 옵셔널 타입 사용
 - 프로퍼티 지연 초기화에 많이 사용
 */


/*:
 ## Nil-coalescing Operator
 */
// nil값일때 다른값으로 대체를 하고싶을때
print("\n---------- [ Nil-coalescing ] ----------\n")

optionalStr = nil

var result = ""
if optionalStr != nil {
   result = optionalStr!
} else {
   result = "This is a nil value"
}
print(optionalStr)
print(result)


let anotherExpression = optionalStr ?? "This is a nil value"
print(optionalStr)
print(anotherExpression)


let optionalInteger: Int? = 100
let anotherExpression2 = optionalInteger ?? -1
print(anotherExpression2)


// 어디에 쓰일 수 있을까요?
// Example

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)

/*:
 ---
 ### Question
 - isTrue ? a : b   와의 차이
 - optionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기
 ---
 */
// 삼항연산자 결과가 true면 앞에걸 반환, false면 뒤에걸 반환
// 옵셔널을 다루기 위한 닐콜레싱

/*:
 ## Optional Chaining
 */
let answer = optionalStr ?? "This is a nil value"
// -> 삼항 연산자 변환
let answer2 = optionalStr != nil ? optionalStr! : "This is a nil value"


print("\n---------- [ Optional Chaining ] ----------\n")

let greeting: [String: String] = [
  "John": "Wassup",
  "Jane": "Morning",
  "Edward": "Yo",
  "Tom": "Howdy",
  "James": "Sup"
]

// 딕셔너리에서 밸류값은 옵셔널
print(greeting["John"])
print(greeting["John"]?.count)
print(greeting["NoName"])

// Optional Chaining
print(greeting["John"]?.lowercased().uppercased())
print(greeting["Alice"]?.lowercased().uppercased())

// Optional Binding
if let greetingValue = greeting["John"] {
  print(greetingValue.lowercased().uppercased())
}

/*:
 ---
 ### Question
 - 아래 두 종류 옵셔널의 차이점이 무엇일까요?
 ---
 */
// 배열 자체가
print("\n---------- [ ] ----------\n")

var optionalArr1: [Int]? = [1,2,3]
var optionalArr2: [Int?] = [1,2,3]


var arr1: [Int]? = [1,2,3]
//arr1.append(nil)
//arr1 = nil

//print(arr1?.count)
//print(arr1?[1])


var arr2: [Int?] = [1,2,3]
//arr2.append(nil)
//arr2 = nil

//print(arr2.count)
//print(arr2[1])
//print(arr2.last)


/*:
 ---
 ## Optional Function Types
 ---
 */
print("\n---------- [ Optional Function ] ----------\n")

func voidFunction() {
  print("voidFunction is called")
}

//var functionVariable: () -> () = voidFunction
var functionVariable: (() -> ())? = voidFunction
functionVariable?()

functionVariable = nil
functionVariable?()



func sum(a: Int, b: Int) -> Int {
  a + b
}
sum(a: 2, b: 3)

//var sumFunction: (Int, Int) -> Int = sum(a:b:)
var sumFunction: ((Int, Int) -> Int)? = sum(a:b:)
type(of: sumFunction) //

//print(sumFunction?(1, 2))
//print(sumFunction!(1, 2))

//sumFunction = nil
//sumFunction?(1, 2)
//sumFunction!(1, 2)




/*:
 ---
 ### Question
 - 아래 내용 참고하여 함수 정의
 ---
 */
/*
 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수를 만들되
 2번째 파라미터와 결과값의 타입은 옵셔널로 정의.
 두 번째 파라미터 입력값으로 nil 이나 0이 들어오면 결과로 nil을 반환하고, 그 외에는 계산 결과 반환
 
 func calculateModulo(op1: Int, op2: Int?) -> Int? {
 }
 */


/*:
 ---
 ### Answer
 ---
 */
// OptionalStr ?? "This is a nil value" 를 3항 연산자로 바꿔보기
let answer1 = optionalStr != nil ? optionalStr! : "This is a nil value"




// 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수
func calculateModulo(op1: Int, op2: Int?) -> Int? {
  guard let op2 = op2, op2 != 0 else { return nil }
  return op1 % op2
}

calculateModulo(op1: 10, op2: 4)
calculateModulo(op1: 39, op2: 5)




//: [Next](@next)


import Foundation


/*
 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수
 */

// Optional Binding을 이용한 방식
func combineString1(str1: String?, str2: String?, str3: String?) -> String {
  var combinedString = ""
  if let unwrappedString = str1 {
    combinedString += unwrappedString
  }
  if let unwrappedString = str2 {
    combinedString += unwrappedString
  }
  if let unwrappedString = str3 {
    combinedString += unwrappedString
  }
  return combinedString
}

// Nil-coalescing Operator 를 이용한 방식
func combineString2(str1: String?, str2: String?, str3: String?) -> String {
  let string1 = str1 ?? ""
  let string2 = str2 ?? ""
  let string3 = str3 ?? ""
  return string1 + string2 + string3
}

combineString1(str1: "AB", str2: "CD", str3: "EF")
combineString1(str1: "AB", str2: nil, str3: "EF")
combineString2(str1: "AB", str2: "CD", str3: "EF")
combineString2(str1: "AB", str2: nil, str3: "EF")





/*
 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
 enum Arithmetic {
   case addition, subtraction, multiplication, division
 }
 func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
   // 코드
 }
 */

print("\n--------------------\n")

enum Arithmetic {
  case addition, subtraction, multiplication, division
}

func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
  switch op {
  case .addition:
    return operand1 + operand2
  case .subtraction:
    return operand1 - operand2
  case .multiplication:
    return operand1 * operand2
  case .division:
    return Int(operand1 / operand2)
  }
}

print(calculator(operand1: 15, operand2: 25, op: .addition))
print(calculator(operand1: 30, operand2: 10, op: .subtraction))
print(calculator(operand1: 12, operand2: 10, op: .multiplication))
print(calculator(operand1: 24, operand2: 6, op: .division))




//: ### 도전과제


/*
 celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 Temperature enum 타입을 정의
 각 케이스에는 Double 타입의 Associated Value 를 받도록 함
 
 추가로 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수 구현
 섭씨 = (화씨 - 32) * 5 / 9
 섭씨 = 켈빈 + 273
 */

enum Temperature {
  case celcius(Double)
  case fahrenheit(Double)
  case kelvin(Double)
  
  func toCelcius() -> Double {
    switch self {
    case .celcius(let value): return value
    case .fahrenheit(let value): return (value - 32) * 5 / 9
    case .kelvin(let value): return value + 273
    }
  }
}

var temperature: Temperature = .celcius(30)
temperature.toCelcius()

temperature = .fahrenheit(86)
temperature.toCelcius()

temperature = .kelvin(-273)
temperature.toCelcius()





