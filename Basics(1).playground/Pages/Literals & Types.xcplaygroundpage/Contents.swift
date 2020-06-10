//: [Previous](@previous)
/*:
 # Literals & Types
 * 리터럴
   - 소스코드에서 고정된 값으로 표현되는 문자 (데이터) 그 자체
   - 정수 / 실수 / 문자 / 문자열 / 불리언 리터럴 등
 */

/*:
 ---
 ## Numeric Literals
 ---
 */
var signedInteger = 123
signedInteger = +123
signedInteger = -123
type(of: signedInteger) // Int


// 10진수
let decimalInteger = 17
// 2진수
let binaryInteger = 0b10001
type(of: binaryInteger) // Int

// 8진수
let octalInteger = 0o21
// 16진수
let hexadecimalInteger = 0x11

var bigNumber = 1_000_000_000
bigNumber = 1_0000_0000_0000
bigNumber = 000_001_000_000_000
bigNumber = 0b1000_1000_0000
bigNumber = 0xAB_00_FF_00_FF

/*:
 ---
 ## Integer Types
 *  8-bit : Int8, UInt8
 * 16-bit : Int16, UInt16
 * 32-bit : Int32, UInt32
 * 64-bit : Int64, UInt64
 * Platform dependent : Int, UInt (64-bit on modern devices)
 ---
 */
var integer = 123
integer = -123
type(of: integer) // Int

var unsignedInteger: UInt = 123
type(of: unsignedInteger)// UInt


MemoryLayout<Int8>.size
Int8.max
Int8.min

MemoryLayout<UInt8>.size
UInt8.max
UInt8.min

MemoryLayout<Int32>.size
Int32.max
Int32.min

MemoryLayout<Int64>.size
Int64.max
Int64.min


/*:
---
### Question
- Int 에 Int32.max ~ Int64.max 사이의 숫자를 넣었을 경우 생각해야 할 내용은?
---
*/

MemoryLayout<Int>.size
Int.max
Int.min

MemoryLayout<UInt>.size
UInt.max
UInt.min


//Int32.max
//Int64.max

//let q1 = Int(Int32.max) + 1
//Int32.max + 1
//Int64.max + 1



/*:
 ---
 ## Overflow Operators
 ---
 */

// 아래 각 연산의 결과는?

// Overflow addition
//var add: Int8 = Int8.max + 1
var add: Int8 = Int8.max &+ 1

Int8.max &+ 1
Int32.max &+ 1
Int64.max &+ 1

// 01111111
// 10000000



/*:
 ## Floating-point Literal
 */
var floatingPoint = 1.23
floatingPoint = 1.23e4
type(of: floatingPoint)

var floatingPointValue = 1.23
type(of: floatingPointValue)

var floatValue: Float = 1.23
type(of: floatValue)

MemoryLayout<Float>.size
Float.greatestFiniteMagnitude
Float.leastNormalMagnitude

MemoryLayout<Double>.size
Double.greatestFiniteMagnitude
Double.leastNormalMagnitude


/***************************************************
 Double - 최소 소수점 이하 15 자리수 이하의 정밀도
 Float - 최소 소수점 이하 6 자리수 이하의 정밀도
 부동 소수점이므로 소수점 이하의 정밀도는 변경 될 수 있음
 ***************************************************/

/*:
 ---
 ## Boolean Literal
 ---
 */
var isBool = true
type(of: isBool)
// Bool

isBool = false
//isBool = False x
//isBool = 1 x
//isBool = 0 x


/*:
 ---
 ## String Literal
 ---
 */
let str = "Hello, world!"
type(of: str)
// String

let str1 = ""
type(of: str1)
// String

var language: String = "Swift"

/*:
 ---
 ## Character Literal
 ---
 */

var nonCharacter = "C"
type(of: nonCharacter)
// String

var character: Character = "C"
type(of: character)
// Character

MemoryLayout<String>.size
MemoryLayout<Character>.size


//character = "string" // error
//character = ' ' // error
//character = "" // error
//character = " " // 공백도 한글자


/*:
 ---
 ## Typealias
 - 문맥상 더 적절한 이름으로 기존 타입의 이름을 참조하여 사용하고 싶을 경우 사용
 ---
 */
// 타입 별칭
// typealias <#type name#> = <#type expression#>

typealias Name = String

let name: Name = "Tory"
let nameString: String = "Tory"

type(of: name) // String
type(of: nameString) // String


//: [Next](@next)
