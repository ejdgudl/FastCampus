//: [Previous](@previous)
/*:
 # Function
 - Functions are self-contained chunks of code that perform a specific task
 - 일련의 작업을 수행하는 코드 묶음을 식별할 수 있는 특정한 이름을 부여하여 사용하는 것
 - 유형
   - Input 과 Output 이 모두 있는 것 (Function)
   - Input 이 없고 Output 만 있는 것 (Generator)
   - Input 이 있고 Output 은 없는 것 (Consumer)
   - Input 과 Output 이 모두 없는 것
 */

/*
 func <#functionName#>(<#parameterName#>: <#Type#>) -> <#ReturnType#> {
   <#statements#>
 }
 */


// 함수는 왜 쓸까요?



func timesTable(num: Int) {
  for i in 1...3 {
    print("\(num) * \(i) = \(num * i)")
  }
}
timesTable(num: 5)
timesTable(num: 2)



/*:
 ---
 ## Functions without parameters
 ---
 */
print("\n---------- [ Functions without parameters ] ----------\n")

print("Hello, world!")

func hello1() {
  print("Hello, world!")
}

hello1()   // 함수를 호출한 코드가 돌려받는 값이 없음


func hello2() -> String {
  return "Hello, world!"
}

hello2()   // 함수를 호출한 코드가 String 타입의 값을 돌려받음


/*:
 ---
 ## Functions without return values
 ---
 */
print("\n---------- [ Functions without return values ] ----------\n")

func say(number: Int) {
  print(number)
}

func say(word: String) -> Void {
  print(word)
}

func say(something: String) -> () {
  print(something)
}

say(number: 1)
say(word: "1")
say(something: "1")


/*:
 ---
 ## Functions with params and return values
 ---
 */
print("\n---------- [ Functions with params and return values ] ----------\n")


func addNumbers(a: Int, b: Int) -> Int {
  return a + b
}

addNumbers(a: 10, b: 20)
addNumbers(a: 3, b: 5)



func greet(person: String) -> String {
  let greeting = "Hello, " + person + "!"
  return greeting
  
  // return "Hello, " + person + "!"
}

greet(person: "Anna")
greet(person: "Brian")



/*:
 ---
 ## Omit Return
 ---
 */
func addTwoNumbers(a: Int, b: Int) -> Int {
  a + b
//  return a + b   // 동일
}

addTwoNumbers(a: 1, b: 2)


/*:
---
## Function Scope
---
*/
let outside = "outside"
func scope() {
  print(outside)
  let inside = "inside"
  print(inside)
}

//print(inside)


/*:
 ---
 ## Argument Label
 ---
 */
/*
 func functionName(<#parameterName#>: <#Type#>) {}
 */

func someFunction(first: Int, second: Int) {
  print(first, second)
}
someFunction(first: 1, second: 2)


/*
 func functionName(<#argumentName#> <#parameterName#>: <#Type#>) {}
 */


// Specifying Argument Labels

func multiplyNumber(lhs num1: Int, rhs num2: Int) {
  num1 + num2
}

multiplyNumber(lhs: 10, rhs: 10)



// Omitting Argument Labels

func someFunction(_ first: Int, second: Int) {
  print(first, second)
}

//someFunction(first: 1, second: 2)
someFunction(1, second: 2)


/*:
 ---
 ### Question.
 - Argument Label을 별도로 지정하는 건 어떤 경우인가요
 ---
 */

// argumentLabel 지정 예시
func use(item: String) {
  print(item)
}
use(item: "Macbook")

func speak(to name: String) {
  print(name)
}
speak(to: "Tory")


/*:
 ---
 ### Question
 - 이름을 입력 값으로 받아서 출력하는 함수 (기본 형태)
 - 나이를 입력 값으로 받아서 출력하는 함수 (Argument Label 생략)
 - 이름을 입력 값으로 받아 인사말을 출력하는 함수 (Argument Label 지정)
 ---
 */
// 하단 Answer 참고



/*:
---
## Default Parameter Values
---
*/

func functionWithDefault(param: Int = 12) -> Int {
  return param
}

functionWithDefault(param: 6)
// param is 6

functionWithDefault()
// param is 12



/*:
---
## Variadic Parameters
---
*/
func average(num1: Int, num2: Int){
  // 평균
}
average(num1: 1, num2: 2)
//average(num1: 1, num2: 2, num3: 3)



func arithmeticAverage(_ numbers: Double...) -> Double {
  var total = 0.0
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}

arithmeticAverage(1, 2, 3)
arithmeticAverage(1, 2, 3, 4, 5)
arithmeticAverage(3, 8.25, 18.75)

//print(10,20,30,40,50)
//print(1,2,3,4,5,6,7)



//func arithmeticAverage2(_ numbers: Double..., _ last: Double) {
//  print(numbers)
//  print(last)
//}
//
//arithmeticAverage2(1, 2, 3, 5)


//func arithmeticAverage3(_ numbers: Double..., and last: Double) {
//  print(numbers)
//  print(last)
//}
//
//arithmeticAverage3(1, 2, 3, and: 5)


/*:
 ---
 ## Nested Functions
 - 외부에는 숨기고 함수 내부에서만 사용할 함수를 중첩하여 사용 가능
 ---
 */
func chooseFunction(plus: Bool, value: Int) -> Int {
  func plusFunction(input: Int) -> Int { input + 1 }
  func minusFunction(input: Int) -> Int { input - 1 }
  
  if plus {
    return plusFunction(input: value)
  } else {
    return minusFunction(input: value)
  }
}


var value = 4
chooseFunction(plus: true, value: value)
chooseFunction(plus: false, value: value)




/*:
 ---
 ### Answer
 ---
 */

func print(name: String) {
  print(name)
}
print(name: "Tory")


func printAge(_ age: Int) {
  print(age)
}
printAge(4)


func sayHello(to name: String) {
  print(name)
}
sayHello(to: "Lilly")



//: [Next](@next)
