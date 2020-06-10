# **Collection**

```swift
- Array
- Dictionary
- Set

Mutability

- let => Immutable Collection
- var => Mutable Collection

// value 타입, Generic 타입(어떤값이든 받을수 있도록 처리하는 분법,기능)
```



## Array

- Ordered Collection

- Zero-based Integer Index

```swift
var variableArray = [1, 2]
variableArray = []
// 변경 가능


let constantArray = [1, 2]
//constantArray = []
// 변경 불가능

Array Type

var arrayFromLiteral = [1, 2, 3]
arrayFromLiteral = []
type(of: arrayFromLiteral)
// Array<Int>, [Int]

//let emptyArray = [] // 타입 미지정 // error

//let emptyArray: [String] = []

```



##  Initialize

```swift

// Type Annotation // 타입 명시
let strArray1: Array<String> = ["apple", "orange", "melon"]
let strArray2: [String] = ["apple", "orange", "melon"]

// Type Inference // 타입 추론
let strArray3 = ["apple", "orange", "melon"]
let strArray4 = Array<String>(repeating: "iOS", count: 5)

// Error
//let strArray5 = ["apple", 3.14, 1]
// Any 타입은 가능하다
```



## Number of Elements

```swift
let fruits = ["Apple", "Orange", "Banana"]
let countOfFruits = fruits.count // 3
countOfFruits // 3

if !fruits.isEmpty {
  print("\(countOfFruits) element(s)")
} else {
  print("empty array")
}
// "3 element"

```



## Retrieve an Element

```swift
// fruits = ["Apple", "Orange", "Banana", endIndex]

fruits[0] // Apple
fruits[2] // Banana
//fruits[123]

fruits.startIndex // 0
fruits.endIndex // 3
type(of: fruits.endIndex) // Int
```



## Searching

```swift
let alphabet = ["A", "B", "C", "D", "E"]

if alphabet.contains("A") {
  print("contains A") // "contains A"
}

if alphabet.contains(where: { str -> Bool in
  // code...
  return str == "A"
}) {
  print("contains A") // "contains A"
}

if let index = alphabet.firstIndex(of: "Q") {
  print("index of D: \(index)")
} else {
  print("No index") // "No index"
}
```



## Add a new Element

```swift
//var alphabetArray: Array<String> = []
//var alphabetArray: [String] = []
//var alphabetArray = [String]()

var alphabetArray = ["A"]
alphabetArray.append("B")
alphabetArray += ["C"]
alphabetArray

var alphabetArray2 = ["Q", "W", "E"]
alphabetArray + alphabetArray2

//alphabetArray.append(5.0)
//alphabetArray + 1

alphabetArray.insert("S", at: 0)
alphabetArray.insert("F", at: 3)
alphabetArray
```



## Change an Existing Element

```swift
alphabetArray = ["A", "B", "C"]
alphabetArray[0] = "Z"
alphabetArray


1...5
1..<5
1...

alphabetArray = ["A", "B", "C", "D", "E", "F"]
alphabetArray[2...]
alphabetArray[2...] = ["Q", "W", "E"]
alphabetArray

```





## Remove an Element

```swift
alphabetArray = ["A", "B", "C", "D", "E"]

let removed = alphabetArray.remove(at: 0)
alphabetArray

alphabetArray.removeAll()


// index 찾아 지우기
alphabetArray = ["A", "B", "C", "D", "E"]

if let indexC = alphabetArray.firstIndex(of: "C") {
  alphabetArray.remove(at: indexC)
}
alphabetArray
```





## Sorting

```swift
alphabetArray = ["A", "B", "C", "D", "E"]
alphabetArray.shuffle()

alphabetArray.sort()
alphabetArray

// shuffle vs shuffled
// sorted vs sort

//func sorted() -> [Element]
//mutating func sort()

alphabetArray.shuffle()

var sortedArray = alphabetArray.sorted()
sortedArray
alphabetArray


// sort by closure syntax

sortedArray = alphabetArray.sorted { $0 > $1 }
alphabetArray.sorted(by: >= )
sortedArray
```





## Enumerating an Array

```swift
// 배열의 인덱스와 내용을 함께 알고 싶을 때

let array = ["Apple", "Orange", "Melon"]

for value in array {
  if let index = array.firstIndex(of: value) {
    print("\(index) - \(value)")
  }
}

for tuple in array.enumerated() {
  print("\(tuple.0) - \(tuple.1)")
//  print("\(tuple.offset) - \(tuple.element)")
}

for (index, element) in array.enumerated() {
  print("\(index) - \(element)")
}


for (index, element) in array.reversed().enumerated() {
  print("\(index) - \(element)")
}
```





## Dictionary

- Element = Unique Key + Value
- Unordered Collection



## Dictionary Type

```swift
let words1: Dictionary<String, String> = ["A": "Apple", "B": "Banana", "C": "City"]
let words2: [String: String] = ["A": "Apple", "B": "Banana", "C": "City"]
let words3 = ["A": "Apple", "B": "Banana", "C": "City"]
```



## Number of Elements

```swift
var words = ["A": "Apple", "B": "Banana", "C": "City"]
let countOfWords = words.count // 3

if !words.isEmpty {
  print("\(countOfWords) element(s)")
} else {
  print("empty dictionary")
}
```





## Retrieve an Element

```swift
//var words = ["A": "Apple", "B": "Banana", "C": "City"]

words["A"] // key로 검색
words["Q"] // 배열에서는 값이 없으면 오류가 나지만 디셔너리에서는 nil을 반환한다

if let aValue = words["A"] {
  print(aValue)
} else {
  print("Not found")
}

if let zValue = words["Z"] {
  print(zValue)
} else {
  print("Not found")
}

print(words.keys)
print(words.values)

let keys = Array(words.keys)
let values = Array(words.values)

print(keys)
print(values)
```



 

## Enumerating an Dictionary

```swift
let dict = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, value) in dict {
  print("\(key): \(value)")
}

for (key, _) in dict {
  print("Key :", key)
}

for (_, value) in dict {
  print("Value :", value)
}

for value in dict.values {
  print("Value :", value)
}

```





## Searching

```swift
//var words = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, _) in words {
  if key == "A" {
    print("contains A key.")
  }
}

if words.contains(where: { (key, value) -> Bool in
  return key == "A"
  }) {
  print("contains A key.")
}
```





## Add a New Element

```swift
words = ["A": "A"]

words["A"]    // Key -> Unique

words["A"] = "Apple"
words

words["B"] = "Banana"
words

words["C"] = "City"
words
```





## Change an Existing Element

```swift
words = [:] // 초기화
words["A"] = "Application"
words

words["A"] = "App"
words


// 키가 없으면 데이터 추가 후 nil 반환,
// 키가 이미 있으면 데이터 업데이트 후 oldValue 반환

if let oldValue = words.updateValue("Apple", forKey: "A") {
  print("\(oldValue) => \(words["A"]!)")
} else {
  print("Insert \(words["A"]!)")
}
words
```





## Remove an Element

```swift
words = ["A": "Apple", "I": "IPhone", "S": "Steve Jobs", "T": "Timothy Cook"]
words["S"] = nil
words["Z"] = nil
words

// 지우려는 키가 존재하면 데이터를 지운 후 지운 데이터 반환, 없으면 nil
if let removedValue = words.removeValue(forKey: "T") {
  print("\(removedValue) removed!")
}
words

words.removeAll()
```





## Nested

```swift
var dict1 = [String: [String]]()
//dict1["arr"] = "A"

dict1["arr1"] = ["A", "B", "C"]
dict1["arr2"] = ["D", "E", "F"]
dict1


var dict2 = [String: [String: String]]()
dict2["user1"] = [
  "name": "나개발",
  "job": "iOS 개발자",
  "hobby": "코딩",
]
dict2["user2"] = [
  "name": "나코딩",
  "job": "Android 개발자",
  "hobby": "코딩",
]
dict2
```



