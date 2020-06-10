# **Optionals**

Question

- 값이 0인 것과 없는 것의 차이는? (Empty vs Valueless)

```swift
 옵셔널은 아예 없을수도 있다라는 걸 말해주고싶을때 사용
 0은 하나의 값
 없는건 아예 없는거
```

```
Optional 은 값이 없을 수 있는(absent) 상황에 사용
Objective-C 에는 없는 개념
옵셔널 타입은 2가지 가능성을 지님

값을 전혀 가지고 있지 않음
값이 있으며, 그 값에 접근하기 위해 옵셔널을 벗겨(unwrap)낼 수 있음
```

```swift
let possibleNumber = "123"
var convertedNumber = Int(possibleNumber)
type(of: convertedNumber)
// Optional(Int)
// 예를 들어 Hello를 Int로 바꿀수 없기 때문에
```



## Optional Type Declaration

```swift
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
```





## Optional Biding and Forced Unwrapping

```swift
// 옵셔널 언래핑


var convertedNumber: Int? = 123

if convertedNumber != nil {
  // warning + Optional(123)
  print("convertedNumber has an integer value of \(convertedNumber).")
}
// 명확하게 값이 있다라는걸 알려주게끔 언래핑을 해줘야한다
```







## Optional Binding

```swift
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
```





## Forced Unwrapping

```swift
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
```



## IUO (Implicitly Unwrapped Optionals)

```swift
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
```





## Nil-coalescing Operator

```swift
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

```



## Optional Chaining

```swift
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

```





