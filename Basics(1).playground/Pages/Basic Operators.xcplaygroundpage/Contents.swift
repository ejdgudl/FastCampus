//: [Previous](@previous)
/*:
 # Basic Operators
 */
/*:
 ---
 ## Terminology
 ---
 */
let a = 123
let b = 456
let c: Int? = 789

// Unary Operator (단항 연산자)
-a

// Prefix (전위 표기법)
-a

// Postfix (후위 표기법)
c!


// Binary Operator (이항 연산자)
a + b

// Infix (중위 표기법)
a + b


// Ternary Operator (삼항 연산자)
// Swift 에서 삼항 연산자는 단 하나
a > 0 ? "positive" : "zero or negative"

if a > 0 {
  "positive"
} else {
  "negative"
}


/*:
 ---
 ## Assignment Operators
 ---
 */
// 할당
var value = 0
value = value + 10
value = value - 5
value = value * 2
value = value / 2
value = value % 2
// 모듈로
10 % 2 // 나머지 0
11 % 2 // 나머지 1
13 % 3 // 나머지 1

// Compound assignment Operators
value += 10
value -= 5
value *= 2
value /= 2
value %= 2

// 미지원 : value++ , value--
// value++
// value += 1
// value = value + 1

var (x, y) = (1, 2)
print(x, y)


/*:
 ---
 ## Precedence
 ---
 */
//: [연산자 우선 순위 참고](https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations)

1 + 2 * 3
1 + (2 * 3)
(1 + 2) * 3

1 + 2 * 3 + 3
1 + (2 * 3) + 3
1 + 2 * (3 + 3)



/*:
 ---
 ## Comparison Operators
 ---
 */
// Equal to operator
a == b

// Not equal to operator
a != b

// Greater than operator
a > b

// Greater than or equal to operator
a >= b

// Less than operator
a < b

// Less than or equal to operator
a <= b


/*:
 ## Question
 - 숫자가 아닌 문자열에 대한 비교는?
 */

"iOS" > "Apple"
"Application" > "Steve Jobs"
"Swift5" <= "Swift4"
"Playground" == "Playground"


/*:
 ---
 ## Logical Operators
 ---
 */

// Logical AND Operator
true && true
true && false
false && true
false && false

// Logical OR Operator
true || true
true || false
false || true
false || false

// Logical Negation Operator
!true
!false


// Combining Logical Operators
let enteredDoorCode = true
let passedRetinaScan = false
let hasDoorKey = false
let knowsOverridePassword = true



// 다음 논리식에서 어떤 상황일 때 "Open the door"가 출력될까요?

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
  print("Open the door")
} else {
  print("Can't open the door")
}
// Open the door

// Explicit Parentheses
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
  // ...
} else {
  // ...
}

/*:
 ## Question
 - 논리 연산자는 순서에 주의 필요. 순서를 신경 써야 하는 이유는?
 */

func returnTrue() -> Bool {
  print("function called")
  return true
}

// 아래 3개의 케이스에서 returnTrue 메서드는 각각 몇 번씩 호출될까?
// 우선순위 : && > ||

print("\n---------- [ Case 1 ] ----------\n")
returnTrue() && returnTrue() && false || true && returnTrue()

print("\n---------- [ Case 2 ] ----------\n")
returnTrue() && false && returnTrue() || returnTrue()

print("\n---------- [ Case 3 ] ----------\n")
returnTrue() || returnTrue() && returnTrue() || false && returnTrue()


/*:
 ---
 ## Range Operators
 ---
 */
print("\n---------- [ Range Operators ] ----------\n")

// Closed Range Operator
0...100

for index in 1...5 {
  print("\(index) times 5 is \(index * 5)")
}


// Half-Open Range Operator
0..<100

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {   // 0, 1, 2, 3
  print("Person \(i + 1) is called \(names[i])")
}

// One-Sided Ranges
1...
...100
..<100


//               0       1        2       3
//let names = ["Anna", "Alex", "Brian", "Jack"]
names[2...]// ["Brian", "Jack"]
names[...2]// ["Anna", "Alex", "Brian"]
names[..<2]// ["Anna", "Alex"]



//  순서를 반대로 적용하는 방법
for index in (1...5) {
  print("\(index) times 5 is \(index * 5)")
}

// 1) reversed
for index in (1...5).reversed() {
  print("\(index) times 5 is \(index * 5)")
}
print()

// 2) stride
for index in stride(from: 5, through: 1, by: -1) {
  print("\(index) times 5 is \(index * 5)")
}
print()



/*:
 ---
 ### Question
 - reversed 같은 메서드를 쓰지 않고 역순으로 출력되게 하기
 ---
 */
// 참고
let range = 1...5
range.lowerBound   // 하한선
range.upperBound   // 상한선





/*:
---
### Answer
---
*/


for index in range {
  // 1 : 5 - 1 + 1 = 5
  // 2 : 5 - 2 + 1 = 4
  // ...
  let num = range.upperBound - index + range.lowerBound
  print("\(num) times 5 is \(num * 5)")
}


//: [Next](@next)
