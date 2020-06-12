# Type Casting



### **Type Check **

```swift
type(of: 1) // Int
type(of: 2.0) // Double
type(of: "3") // String
anyArr[0] 
// 했을때 any 타입은 가지고 있는게 없다
// 컴파일 타임 - 아직 any 타입이기 때문에 Int를 쓸수없다
// 런타임 - typeof로 확인할때는 런타임때 결과이다
  
// Any
let anyArr: [Any] = [1, 2.0, "3"]
type(of: anyArr[0]) // Int
type(of: anyArr[1]) // Double
type(of: anyArr[2]) // String
// 위에 첫번째 type of 의 타입은 최종적으로 Int 타입이지만 사용을 못함

// Generic
func printGenericInfo<T>(_ value: T) { // T라고 타입을 줬을때는 어떤값이 되든간에 T라고 있는 타입이 뭐가 될지 모르지만 어떤값이 들어오면 T라고 그냥 칭하는거다. 동적으로 타입을 변경할수 있다.
  let types = type(of: value)
  print("'\(value)' of type '\(types)'")
}
printGenericInfo(1) // Int
printGenericInfo(2.0) // Double
printGenericInfo("3") // String
```



## 타입 비교 - is

 ```swift
let number = 1
number == 1    // 값 비교
number is Int  // 타입 비교


let strArr = ["A", "B", "C"]

if strArr[0] is String {
  "String"
} else {
  "Something else"
}

if strArr[0] is Int {
  "Int"
}



let someAnyArr: [Any] = [1, 2.0, "3"]

for data in someAnyArr {
  if data is Int {
    print("Int type data :", data)
  } else if data is Double {
    print("Double type data : ", data)
  } else {
    print("String type data : ", data)
  }
}



 ```



## 상속 관계

```swift
class Human {
  var name: String = "name"
}
class Baby: Human {
  var age: Int = 1
}
class Student: Human {
  var school: String = "school"
}
class UniversityStudent: Student {
  var univName: String = "Univ"
}


/*
    Human
   /     \
 Baby   Student
          |
    UniversityStudent
 */

let student = Student()
//student is Human // true
//student is Baby // false
//student is Student // true

let univStudent = UniversityStudent()
//student is UniversityStudent // false
//univStudent is Student // true


/*
 자식 클래스 is 부모 클래스  -> true
 부모 클래스 is 자식 클래스  -> false
 */


let babyArr = [Baby()]
type(of: babyArr)// Array<baby>


// Q. 그럼 다음 someArr 의 Type 은?

let someArr = [Human(), Baby(), UniversityStudent()]
type(of: someArr)
// Array<Human>
// Human 이라는 클래스를 모두 공통적으로가지고 있기 때문에


//someArr[0] is Human    // true
//someArr[0] is Student  // false
//someArr[0] is UniversityStudent  // false
//someArr[0] is Baby     // flase
//
//someArr[1] is Human    // true
//someArr[1] is Student  // false
//someArr[1] is UniversityStudent  // false
//someArr[1] is Baby     // true
//
//someArr[2] is Human    // true
//someArr[2] is Student  // true
//someArr[2] is UniversityStudent  // true
//someArr[2] is Baby     // flase


// Human > name
// Student > school + name

var human: Human = Student()
type(of: human)
// 
// 해당 변수의 타입 vs 실제 데이터의 타입 student

// Q. human 변수의 타입, name 속성의 값, school 속성의 값은?
human.name    // 
human.school  // error 컴파일단에서는 아직은 Human
// typeof 는 런타임단에서 Student

// Q. Student의 인스턴스가 저장된 human 변수에 다음과 같이 Baby의 인스턴스를 넣으면?
human = Baby() //  부모클래스가 같으면 넣어줄수 있따
human = UniversityStudent()


var james = Student() // Student 타입 결정
// 실제로는 var UIViewController = ViewController()랑 같은 개념
james = UniversityStudent() 
james = Baby()   // error


// 부모클래스 타입은 자식 클래스 타입을 가질 수 있음


// Q. 다음 중 james 가 접근 가능한 속성은 어떤 것들인가
//james.name     // Human 속성 // error
//james.age      // Baby 속성 // error
//james.school   // Student 속성 // 접근 가능
//james.univName // UniversityStudent 속성 // 타입은 컴파일단에서는 Student이기 때문에 접근 불가능 


// ex
class ViewController: UIViewController { // ViewController는 자식클래스
  override func viewDidLoad() {
    super.viewDidLoad() {
      super.viewDidLoad()
      // presentingViewController as? UIViewController
      // presentingViewController의 타입은 UIViewController라서
      // 공통적으로 부모클래스 UIViewController가 가진 속성에만 접근 가능하기 때문에
			if let vc = presentingViewController as? ViewController {
        vc.button....
      }
    }
  }
}


// Q. 그럼 Student 타입인 james 객체가 univName을 사용할 수 있도록 하려면 뭘 해야 할까요

if let james = james as? UniversityStudent {
  james.univName
  // 커파일단 에서의 타입과 런타임 단에서의 타입이 다를경우
  // 이런식으로 접근
}
```



# **Type Casting**

- as : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러

- as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환

- as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생

```swift


import UIKit

class Shape {
  var color = UIColor.black
  
  func draw() {
    print("draw shape")
  }
}

class Rectangle: Shape {
  var cornerRadius = 0.0
  override var color: UIColor {
    get { return .white }
    set { }
  }
  
  override func draw() {
    print("draw rect")
  }
}

class Triangle: Shape {
  override func draw() {
    print("draw triangle")
  }
}

/*
 Shape
  - Rectangle 
  - Triangle
 모두 draw() 오버라이드
 */

```



## Upcasting

```swift
/*
 업 캐스팅
 - 상속 관계에 있는 자식 클래스가 부모 클래스로 형 변환하는 것
 - 업캐스팅은 항상 성공하며 as 키워드를 사용
 (자기 자신에 대한 타입 캐스팅도 항상 성공하므로 as 키워드 사용)
 */


// Shape - black, Rectangle - white

let rect = Rectangle() // 실제 타입은 Rectangle
rect.color // white
rect.cornerRadius // 0

let t1 = rect as Shape // 항상 변환 성공 
let t2 = rect as Rectangle // 자기 자신이니깐 안써도 됨

(rect as Shape).color // white
//(rect as Shape).cornerRadius // error Shape에는 cornerRadius가 없기 때문에

//(rect as Rectangle).color //rect.color 로 그냥사용
//(rect as Rectangle).cornerRadius //rect.cornerRadius 로 그냥사용



let upcastedRect: Shape = Rectangle()
type(of: upcastedRect)   // 런타임때 즉 실제 타입은 Rectangle

upcastedRect.color // 공통적인 color에 접근했기때문에 가능
upcastedRect.cornerRadius // error 컴파일단에서는 Shape로 인식하기때문에

(upcastedRect as Shape).color // white
(upcastedRect as Rectangle).color // 자식클래스에게 타입캐스팅할경우에는 ?를 붙혀야함

//부모 클래스 타입으로는 항상 변경할 수 있는데, 자식 클래스로 변경할 수는 없는 이유?
//자식 클래스 타입 <= 부모 크래스 타입
//자식 클래스 타입 => 부모 크래스 타입
//

```



### Downcasting

```swift
/*
 다운 캐스팅
 - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
 - 반드시 성공한다는 보장이 없으므로 옵셔널. as? 또는 as! 를 사용
 */


let shapeRect: Shape = Rectangle() // 런타임에서는 Rectangle 컴파일에서는 Shape
var downcastedRect = Rectangle() // 런타임에서는 Rectangle 컴파일서는 Rectangle

//downcastedRect = shapeRect // 
//downcastedRect = shapeRect as Rectangle // error 자식은 더많이가지고있기때문에

//downcastedRect: Rectangle = shapeRect as? Rectangle  
downcastedRect = shapeRect as! Rectangle  // 캐스팅 가능

//as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
//as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생



//Q. 아래 value 에 대한 Casting 결과는?
let value = 1
//(value as Float) is Float   // 관련이 아예없어서 error
//(value as? Float) is Float  // false nil이기때문에
//(value as! Float) is Float  // error

```

