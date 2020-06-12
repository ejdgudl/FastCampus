# **Memory Management**

**1. GC (Garbage Collection)**

정기적으로 Garbage Collector 가 동작하여 더이상 사용되지 않는 메모리를 반환하는 방식 OS X 에서만 지원했었으나 버전 10.8 (Mountain Lion) 부터 deprecated

**2. MRR (Manual Retain-Release) / MRC (Manual Referece Counting)**

RC(Reference Counting) 를 통해 메모리를 수동으로 관리하는 방식 retain / release / autorelease 등의 메모리 관리 코드를 직접 호출 개발자가 명시적으로 RC 를 증가시키고 감소시키는 작업 수행



## **MRR**

```
RC 에 대한 이해 필요 (Reference Counting / Retain Count / Reference Count) Objective-C 에서는 ARC 해제 가능
```



## **Reference Counting**

```swift
int main(int argc, const char * argv[]) {
 
Person *man = [[Person alloc] init]; // count: 1
[man doSomething];
[man retain];  // count: 2
count : 1
count : 2
   [man doSomething];
 // [man release];
[man doSomething];  // count: 2
[man release];  // count: 1
[man release];  // count: 0
}
return 0;
```



## **Leak vs Dangling Pointer**

```
카운트 할당과 해제는 균형이 맞아야 함
- alloc , retain 이 많을 경우는 Memory Leak 발생 
- release 가 많을 경우 Dangling Pointer (허상, 고아) 발생
```





# **ARC**

### **ARC (Automatic Reference Counting)**

```
RC 자동 관리 방식 (WWDC 2011 발표)
컴파일러가 개발자를 대신하여 메모리 관리 코드를 적절한 위치에 자동으로 삽입
GC 처럼 런타임이 아닌 컴파일 단에서 처리 (Heap 에 대한 스캔 불필요 / 앱 일시 정지 현상 없음)  메모리 관리 이슈를 줄이고 개발자가 코딩 자체에 집중할 수 있도록 함
```



```
ARC 는 클래스의 인스턴스에만 적용 (Class - Reference 타입 , Struct / Enum - Value 타입) 활성화된 참조카운트가 하나라도 있을 경우 메모리에서 해제 되지 않음
참조 타입
- 강한 참조 (Strong) : 기본값. 참조될 때마다 참조 카운트 1 증가
- 약한 참조 (Weak), 미소유 참조 (Unowned) : 참조 카운트를 증가시키지 않음 강한 순환 참조 (Strong Reference Cycles) 에 대한 주의 필요
```





## **Strong Reference Cycle**

```
- 객체에 접근 가능한 모든 연결을 끊었음에도 순환 참조로 인해   활성화된 참조 카운트가 남아 있어 메모리 누수가 발생하는 현상
- 앱의 실행이 느려지거나 오동작 또는 오류를 발생시키는 원인이 됨
```





## **ARC Basic**

```swift
class Person {
  let testCase: String
  init(testCase: String) {
    self.testCase = testCase
  }
  deinit {
    print("\(testCase) is being deinitialized")
  }
}

```



### case 1. Allocation & Release

```swift
var obj1: Person? = Person(testCase: "case1") // init -> count 1
obj1 = nil // nil -> deinit -> relase -> count 0
```



### case 2. 참조 카운트 증가

```swift
var obj2: Person? = Person(testCase: "case2") // count 1
var countUp = obj2 // count 2


obj2 = nil  // count 1
countUp = nil // count 0 -> 메모리에서 사라짐
```





### case 3. Collection 에 의한 참조 카운트

```swift
var obj3: Person? = Person(testCase: "case3") // count 1
var array = [obj3, obj3] // count 3

obj3 = nil // count 2
array.remove(at: 0) // count 1
array.remove(at: 0) // count 0
```





### case 4. 강한 참조, 약한 참조

```swift
var strongObj4 = Person(testCase: "case4") // count 1
print(strongObj4)

weak var weakObj4 = Person(testCase: "case4")  // count 0
// weak은 참조카운트가 증가하지 않는다
// Person을 만들었는데 Person을 유지할려면 count가 최소 1이어야 함 
// 만들자 마자 메모리에서 해제
print(weakObj4)

unowned var unownedObj4 = Person(testCase: "case4") // count 0
// 객체 해제시 nil로 변경
// 만들자 마자 메모리에서 해제
// 참조 객체 해제시에도 기존 포인터 주소 유지, 즉 주소로 접근, 그래서 해제됫는데 주소로 접근해서 error
// 절대로 이 변수를 사용하는동안 절대로 해제되지 않을때 사용해야 한다
// Optional이라서 
print(unownedObj4)



/***************************************************
 unowned. weak  -  let , var
 ***************************************************/

// 다음 4줄의 코드 중 사용 불가능한 것은?

//unowned let unownedLet = strongObj4
//unowned var unownedVar = strongObj4
//weak let weakLet = strongObj4 // weak 은 var 만 사용 가능하다
//weak var weakVar = strongObj4


// unowned 와 weak 의 타입은?
//print("Unowned type: ", type(of: unownedVar))
//print("Weak type: ", type(of: weakVar))
```



# **Scope**

- 스코프 범위에 의한 할당 및 해제

```swift
class LocalScope {
  func doSomething() {}
  deinit {
    print("LocalScope is being deinitialized")
  }
}

class ClassProperty {
  func doSomething() {}
  deinit {
    print("ClassProperty is being deinitialized")
  }
}

class Application {
  var prop = ClassProperty()
  
  func allocateInstance() {
    let local = LocalScope() // count 1
    local.doSomething() // local변수는 메서드가 끝나는 시점에 사라진다 // count 0 
  }
  
  deinit {
    print("Application is being deinitialized")
  }
}


// Q. 아래의 코드 실행 시 출력되는 메시지는?

var app: Application? = Application()
app?.prop.doSomething()
app?.allocateInstance()



// Q. ClassProperty 객체의 deinit 메서드가 호출되려면 어떻게 할까요?
app = nil

```





## **Strong Reference Cycles**

```swift
class Person {
  var pet: Dog?
  func doSomething() {}
  deinit {
    print("Person is being deinitialized")
  }
}

class Dog {
  var owner: Person?
  func doSomething() {}
  deinit {
    print("Dog is being deinitialized")
  }
}



var giftbot: Person? = Person()
var tory: Dog? = Dog()

giftbot?.pet = tory
tory?.owner = giftbot


```

## Question

두 객체를 메모리에서 할당 해제하려면 어떻게 해야 할까요?

```swift
// 순서 주의

giftbot?.pet = nil // Dog count 1
tory?.owner = nil// Person count 1

giftbot = nil  // Person count 0
tory = nil  // Dog count 0

// 안에 있는 내용을 먼저 nil로 만들고 최종적으로 nil을 또 넣어줘야 해제 된다

```



## **Strong, Unowned, Weak**

```swift
class Teacher {
  var student: Student?
  deinit {
    print("Teacher is being deinitialized")
  }
}

class Student {
  // strong, unowned, weak
  let teacher: Teacher
//  unowned let teacher: Teacher 
  // 참조 카운트가 증가하지 않는다
//  weak var teacher: Teacher?
  // 참조 카운트가 증가하지 않는다
  
  init(teacher: Teacher) {
    self.teacher = teacher
  }
  deinit {
    print("Student is being deinitialized")
  }
}

var teacher: Teacher? = Teacher()
var student: Student? = Student(teacher: teacher!)
teacher?.student = student


print("\n---------- [ teacher release ] ----------\n")
// 스트롱일때
teacher?.student = nil // 하나만 nil만들어도 순차적으로 없어진다
// 언노운일때, 윅일때
teacher = nil // teacher에 count는 증가하지 않는다

print("\n---------- [ student release ] ----------\n")
student = nil



/***************************************************
 1) strong  : 명시적으로 nil 대입 필요. teacher?.student = nil
 2) unowned : 자동으로 deinit. nil 처리 된 속성에 접근하면 런타임 에러 발생
 3) weak    : 자동으로 deinit. nil 처리 된 속성에 접근하면 nil 반환
 ***************************************************/

```



## **Comparing Structures and Classes**

[ 클래스와 구조체 공통점 ]

 \- 값을 저장하기 위한 프로퍼티

 \- 기능을 제공하기 위한 메서드

 \- 초기 상태를 설정하기 위한 생성자

 \- 기본 구현에서 기능을 추가하기 위한 확장(Extension)

 \- 특정 값에 접근할 수 있는 첨자(Subscript)

 \- 특정한 기능을 수행하기 위한 프로토콜 채택

 \- Upper Camel Case 사용

```swift
class SomeClass {
  var someProperty = 1
  func someMethod() {}
}
struct SomeStruct {
  var someProperty = 1
  func someMethod() {}
}

let someClass = SomeClass()
let someStruct = SomeStruct()

// 구조체는 상속이 불가능하다
// 구조체는 deinit을 따로 쓰지않는다 힙에 쌓이기 때문에
// 참조 카운트가 없다
// 그냥 값 타입

```

[ 클래스만 제공하는 기능 ]

 \- 상속 (Inheritance)

 \- 소멸자 (Deinitializer)

 \- 참조 카운트 (Reference counting)

```swift
// 상속
struct ParentS {}
//struct Child: Parent {}   // 오류


// 소멸자
struct Deinit {
//  deinit { }    // 오류
}

// 참조 카운트(Reference Counting)  X
```



## 값 타입 vs 참조 타입

```swift
class Dog {
  var name = "토리"
}
struct Cat {
  var name = "릴리"
}

let dog = Dog()
let cat = Cat()

dog.name = "릴리" // 참조타입은 변경 가능
cat.name = "토리" // 구조체는 var 로 되있어야 변경가능





let dog1 = dog
var cat1 = cat
dog1.name = "뽀삐"
cat1.name = "뽀삐"
dog.name
cat.name


//dog === dog1 // 주소값 비교
//cat === cat1 // 구조체를 비교할때는 쓰지 않는다. 힙을 사용하지 않는 값타입이기 떄문에 

```





## 생성자 비교

```swift
/*
 var로 선언된 변수
 */

class UserClass1 {
  var name = "홍길동"
}
struct UserStruct1 {
  var name = "홍길동"
}

let userC1 = UserClass1()// init 생성자가 따로없음 값을 지정해줫었기 때문에
let userS1_1 = UserStruct1()
let userS1_2 = UserStruct1(name: "깃봇") // 값을 바꿀수 있도록 생성자가 기본제공 되있음
userS1_1.name
userS1_2.name

// class는 아무것도 없는 init과 생성자가 필요할때의 init 두개다 만들어줘야 한다.

/*
 프로퍼티에 초기화 값이 없을 때
 */

class UserClass2 { // 초기화값이 반드시 있거나 init메서드를 만들어 줘야 한다
  var name: String
  // 초기화 메서드 없으면 오류
  init(name: String) { self.name = name }
}

struct UserStruct2 { // 초기화 값이 없어도 인스턴스를 생성할때 생성자가 자동으로 생성된다
  var name: String
  var age: Int
  
  // 초기화 메서드 자동 생성
  // 단, 생성자를 별도로 구현했을 경우 자동 생성하지 않음
//  init(name: String) {
//    self.name = name
//    self.age = 10
//  }
}

let userC2 = UserClass2(name: "홍길동")
let userS2 = UserStruct2(name: "홍길동", age: 10)



/*
 저장 프로퍼티 중 일부에만 초기화 값이 있을 때
 */

class UserClass3 {
  let name: String = "홍길동"
  // 저장 프로퍼티 중 하나라도 초기화 값이 없는 경우 생성자를 구현해야 함
//  let age: Int // error
}

struct UserStruct3 {
  let name: String = "홍길동" // let 으로 선언해서 바꿀필요없어짐
  let age: Int
}
// 초기화 값이 없는 저장 프로퍼티에 대해서만 생성자로 전달
let userS3 = UserStruct3(age: 10) // 없는거만 초기화 메서드가 자동으로 만들어짐




/*
 지정(Designated) 생성자, 편의(Convenience) 생성자
 */
class UserClass4 {
  let name: String
  let age: Int
  
  // 지정 생성자에서는 모든 저장 프로퍼티를 초기화 해야 함
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
  
  // 편의 생성자에서는 일부만 초기화하고 다른 생성자를 호출 가능
  convenience init(age: Int) { 
    self.init(name: "홍길동", age: age)
  }
}

struct UserStruct4 {
  let name: String
  let age: Int
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
  
  // Convenience 키워드 사용 X, 지정과 편의 생성자 별도 구분 없음
//  convenience init(age: Int) {
  init(age: Int) {
    self.init(name: "홍길동", age: age)
  }
}

// 따라서 extension에서도 생성자 추가 가능
extension UserStruct4 {
  init(name: String) {
    self.name = name
    self.age = 10
  }
}

let userS4_1 = UserStruct4(name: "홍길동")
let userS4_2 = UserStruct4(age: 20)


```




## 프로퍼티 변경

```swift
struct PointStruct {
  var x = 0
  
 mutating func updateX() { //stack에 있는 값을 비꿀때 함수에서만 mutating을 명시해줘야함 (Enum도) 
    self.x = 5
  }

  var updateProperty: Int { // 연산프로퍼티는 mutating이 기본 세팅이다
    get { x }
    set { x = newValue }    // 연산 프로퍼티의 setter는 기본적으로 mutating
  }
}


//var p2 = PointStruct()
//p2.updateX()
//p2.updateProperty = 3
//p2.updateProperty




class PointClass {
  var x = 0
  
//  mutating
  func updateX() {
    self.x = 5
  }
}

let p1 = PointClass()
p1.updateX()


```



애플 권장사항 
- 구조체를 기본으로 사용
- 클래스를 사용해야 할 때
  > Objective-C와 호환성이 필요할 때
  > equality(동등성) 외에 identity(정체성, 동일성)를 제어해야 할 때
  > RC(Reference Counting)와 소멸자(deinitialization)가 필요할 때
  > 값이 중앙에서 관리되고 공유되어야 할 때



```
일반적으로 데이터쪽은 구조체 
ui같은건 클래스로 작성을 한다
stack	이 속도적인 면에서 우수하다
```

