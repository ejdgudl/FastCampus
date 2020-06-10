# **closure**

- 코드에서 사용하거나 전달할 수 있는 독립적인 기능을 가진 블럭

- 함수도 클로저의 일종
- 주변 문맥(Context)의 값을 캡쳐할 수 있으며, 간단한 문법으로 쓰여진 이름 없는 클로저

```swift
func aFunction() {
  print("This is a function.")
}
aFunction()
aFunction()

({
  print("This is a closure.")
})()
// This is a closure
// 이름 없이 실행할수 있음

```



```swift
// 클로저를 변수에 담아 이름 부여 가능
let closure = {
  print("This is a closure.")
}

// 함수도 변수로 저장 가능
var function = aFunction

// 같은 타입일 경우 함수나 클로저 관계없이 치환 가능
function = closure
function()
type(of: function) // (() -> ())
type(of: closure) // (() -> ())
```



```swift
// 파라미터 + 반환 타입을 가진 함수
func funcWithParamAndReturnType(_ param: String) -> String {
  return param + "!"
}
// 인풋과 아웃풋이 있어서 호출할때 원하는 파라미터를 전달한다 (함수)
print(funcWithParamAndReturnType("function"))




// 파라미터 + 반환 타입을 가진 클로저
// Type Annotation 타입 명시해준 방식
let closureWithParamAndReturnType1: (String) -> String = { param in
  return param + "!"
}
// 변수에다 담는다 생각하고 이름지어주고 타입을 지정해 주었고 (String) -> String 
// param 이라는 파라미터도 가질수 있고
// 코드와의 구분을 in 이라는 키워드로 사용하여 구별한다
print(closureWithParamAndReturnType1("closure"))




// Argument Label은 생략. 함수의 Argument Label을 (_)로 생략한 것과 동일


// 파라미터 + 반환 타입을 가진 클로저
let closureWithParamAndReturnType2 = { (param: String) -> String in
  return param + "!"
}
// 타입을 클로저 내에서 명시
// 클로저에서는 아규먼트레이블이 자동으로 생략
print(closureWithParamAndReturnType2("closure"))




// 파라미터 + 반환 타입을 가진 클로저
// Type Inference 타입 추론
let closureWithParamAndReturnType3 = { param in
  param + "!"
}
// param이 뭔지는 몰라도 스트링을 return 했기 때문에 스트링 타입임을 추론
// 다른내용 없이 한줄이면 return도 생략
print(closureWithParamAndReturnType3("closure"))
```



```swift
/// 문자열을 입력받으면 그 문자열의 개수를 반환하는 클로져 구현

// 1단계 - 함수로 생각
func stringCount(str: String) -> Int {
  return str.count
}
print(stringCount(str: "Swift"))

// 2단계 - 클로저로 변형
let stringCount = { (str: String) -> Int in
  return str.count
}
stringCount("Swift")

// 3단계 - 문법 최적화
let stringCount2: (String) -> Int = { $0.count }
// str 을 $0으로 대체
```



```swift
/// 숫자 하나를 입력받은 뒤 1을 더한 값을 반환하는 클로져 구현
let addOne = { (num: Int) -> Int in
  return num + 1
}
addOne(5)

```



## Closure를 쓰는 이유?

```
 - 문법 간소화 / 읽기 좋은 코드
 - 지연 생성 // 실제로 이코드를 사용해야할 상황이 왔을때 그때 메모리에 올라간다
 - 주변 컨텍스트의 값을 캡쳐하여 작업 수행 가능
```



## Syntax Optimization

```
 Swift 클로저 문법 최적화
 - 문맥을 통해 매개변수 및 반환 값에 대한 타입 추론
 - 단일 표현식 클로저에서의 반환 키워드 생략
 - 축약 인수명
 - 후행 클로저 문법
```

```swift
// 입력된 문자열의 개수를 반환하는 클로저를 함수의 파라미터로 전달하는 예
func performClosure(param: (String) -> Int) {
  param("Swift")
}

performClosure(param: { (str: String) -> Int in
  return str.count
})

performClosure(param: { (str: String) in
  return str.count // count로 인해서 반환타입 생략 가능
})

performClosure(param: { str in // 위에 함수에서 인풋 타입을 지정 해주었기 때문에 인풋타입 생략 가능 
  return str.count 
})

performClosure(param: { //  매개변수명 $로 대체
  return $0.count
})

performClosure(param: { // 한줄이어서 return 생략가능
  $0.count
})

performClosure(param: ) {
  $0.count
} 
performClosure() { // 마지막 파라미터에 한해서 파라미터 이름 생략 가능
  $0.count
}

performClosure { $0.count }
```



## Inline closure

- 함수의 인수(Argument)로 들어가는 클로저

```swift
func closureParamFunction(closure: () -> Void) {
  closure()
}
func printFunction() {
  print("Swift Function!")
}
let printClosure = {
  print("Swift Closure!")
}

closureParamFunction(closure: printFunction)
closureParamFunction(closure: printClosure)

// 인라인 클로저 - 변수나 함수처럼 중간 매개체 없이 사용되는 클로저
closureParamFunction(closure: {
  print("Inline closure - Explicit closure parameter name")
})
```



## Trailing Closure

- 함수의 괄호가 닫힌 후에도 인수로 취급되는 클로저

- 함수의 마지막 인수(Argument)에만 사용 가능하고 해당 인수명은 생략

- 하나의 라인에 다 표현하지 못할 긴 클로져에 유용

```swift
// 후위 또는 후행 클로저
// closureParamFunction { <#code#> }

closureParamFunction(closure: {
  print("Inline closure - Explicit closure parameter name")
})
closureParamFunction() {
  print("Trailing closure - Implicit closure parameter name")
}
closureParamFunction {
  print("Trailing closure - Implicit closure parameter name")
}



func multiClosureParams(closure1: () -> Void, closure2: () -> Void) {
  closure1()
  closure2()
}

multiClosureParams(closure1: {
  print("inline")
}, closure2: {
  print("inline")
})

multiClosureParams(closure1: {
  print("inline")
}) { 
  print("trailing")
}


```

```swift
정수를 하나 입력받아 2의 배수 여부를 반환하는 클로져

let multiple = { (num: Int) -> String in
    if num.isMultiple(of: 2) {
        return "y"
    }
    return "n"
}
multiple(2)

정수를 두 개 입력 받아 곱한 결과를 반환하는 클로져

let multiple2 = { (num1: Int, num2: Int) -> Int in
   return num1 * num2
}
multiple2(1, 2)
```

