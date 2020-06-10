//: [Previous](@previous)
/*:
 # Practice
 */
/*:
 ---
 ## Conditional Statements
 ---
 */
/*
 - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
 - 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
 - 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수W
   (switch where clause 를 이용해 풀어볼 수 있으면 해보기)
 */
func grade(score: Double) -> String {
    if score == 4.5 {
        return "A+"
    } else if score == 4.0 {
        return "A"
    } else {
        return "B+"
    }
}
grade(score: 4)

func month(monthNum: Int) -> String {
    if monthNum == 1 {
        return "Jan"
    } else if monthNum == 2 {
        return "Feb"
    } else {
        return "none"
    }
}
month(monthNum: 1)
func postiveNum(num1: Int, num2: Int, num3: Int) -> Bool {
    var multiple = num1 * num2 * num3
    switch multiple {
    case let x where x > 0:
        return true
    default:
        return false
    }
}

postiveNum(num1: -2, num2: 2, num3: 2)
/*:
 ---
 ## Loops
 ---
 */
/*
 반복문(for , while , repeat - while)을 이용해 아래 문제들을 구현해보세요.
 - 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
   (Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
   ex) 5! = 5 x 4 x 3 x 2 x 1
 - 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
   (2, 5 를 입력한 경우 결과는 2의 5제곱)
 - 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
   (1234 인 경우 각 자리 숫자를 합치면 10)
 */
func factorial(number: Int) -> Int {
  var answer = 1
  for i in 1...number {
    answer *= i
  }
  return answer
}

factorial(number: 4)

func myPow(base: Int, power: Int) -> Int {
  var result = 1
  for _ in 1...power {
    result *= base
  }
  return result
}

myPow(base: 2, power: 10)

func addEachDigitNumber(_ number: Int) -> Int {
  var sum = 0
  var dividedNum = number
  while dividedNum != 0 {
    sum += dividedNum % 10
    dividedNum /= 10
  }
  return sum
}

addEachDigitNumber(1543)
/*:
 ---
 ## Control Transfer
 ---
 */
/*
 - 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
   그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
 - 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
 */
func sumNumbers(max: Int) -> Int {
  var sum = 0
  for i in 1...max {
    sum += i
    if sum > 2000 { return sum }
  }
  return sum
}

sumNumbers(max: 10)

func sumNumbers() {
  var sum = 0
  for i in 1...50 {
    if 20...30 ~= i { continue }
    sum += i
  }
  print(sum)
}

sumNumbers()
//: [Next](@next)
