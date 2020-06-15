# HigherOrderFunction

고차함수란?

- 하나 이상의 함수를 인자로 취하는 함수 
- 함수를 결과로 반환하는 함수

※ Higher-order Function이 되기 위해서는 함수가 First-class Citizen 이어야 한다.



## **First-class citizen**

1급 객체(First class citizen)

- 변수나 데이터에 할당할 수 있어야 한다.
- 객체의 인자로 넘길 수 있어야 한다.
- 객체의 리턴값으로 리턴할 수 있어야 한다.

```swift
 print("function call")
 func function(_ parameter: @escaping ()->()) -> (()->()) {
return parameter
let returnValue = function(firstClassCitizen)
 returnValue()
 
```





## **Higher-order Functions in Swift**

- forEach
  - 컬렉션의 각 요소(Element)에 동일 연산을 적용하며, 반환값이 없는 형태

- map
  - 컬렉션의 각 요소(Element)에 동일 연산을 적용하여, 변형된 새 컬렉션 반환
- filter
  - 컬렉션의 각 요소를 평가하여 조건을 만족하는 요소만을 새로운 컬렉션으로 반환
- reduce
  - 컬렉션의 각 요소들을 결합하여 단일 타입으로 반환. e.g. Int, String
- flatMap
  - 중첩된 컬렉션을 하나의 컬렉션으로 병합
- compactMap
  - 컬렉션의 요소 중 옵셔널이 있을 경우 제거
  - (flatMap으로 사용하다가 Swift 4.1 에서 compactMap 으로 변경됨)


```swift
//Input : myPet 배열 이용
//[ 1번 문제 ]
//Pet 타입의 배열을 파라미터로 받아 그 배열에 포함된 Pet 중   강아지의 나이만을 합산한 결과를 반환하는 sumDogAge 함수 구현 func sumDogAge(pets: [Pet]) -> Int
//[ 2번 문제 ]
//Pet 타입의 배열을 파라미터로 받아 모든 Pet이 나이를 1살씩 더 먹었을 때의 상태를 지닌 새로운 배열을 반환하는 oneYearOlder 함수 구현
//func oneYearOlder(of pets: [Pet]) -> [Pet]
print("\n---------- [ Practice 1 ] ----------\n")

struct Pet {
    enum PetType {
        case dog, cat, snake, pig, bird
    }
    var type: PetType
    var age: Int
}

let myPet = [
    Pet(type: .dog, age: 13),
    Pet(type: .dog, age: 2),
    Pet(type: .dog, age: 7),
    Pet(type: .cat, age: 9),
    Pet(type: .snake, age: 4),
    Pet(type: .pig, age: 5),
]
// 1번
//var dogAge = myPet.filter { $0.type == Pet.PetType.dog }
//print(dogAge)
//type(of: dogAge)
func sumDogAge(pets: [Pet]) -> Int {
    let dogAge = pets.filter { $0.type == Pet.PetType.dog }
    print(dogAge)
    let result = dogAge.reduce(0) { Int($0) + Int($1.age) }
    return result
}
sumDogAge(pets: myPet)

func oneYearOlder(of pets: [Pet]) -> [Pet] {
    return pets.map {
        Pet(type: $0.type, age: $0.age + 1)
    }
}
```

```swift
/*
 고차함수란?
 - 하나 이상의 함수를 인자로 취하는 함수
 - 함수를 결과로 반환하는 함수
 
 ※ 고차 함수가 되기 위한 조건은 함수가 1급 객체여야 한다.
 */

/*
 1급 객체 (First-class citizen)
 - 변수나 데이터에 할당할 수 있어야 한다.
 - 객체의 인자로 넘길 수 있어야 한다.
 - 객체의 리턴값으로 리턴할 수 있어야 한다.
 */

func firstClassCitizen() {
  print("function call")
}

func function(_ parameter: @escaping ()->()) -> (()->()) {
  return parameter
}

let returnValue = function(firstClassCitizen)
returnValue
returnValue()

```



```swift

```


