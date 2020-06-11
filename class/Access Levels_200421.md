# Access Levels
## Point
internal은 기본값이고 같은 모듈에서 사용할수 있고 
fileprivate는 같은 파일에서 사용하기 위한것이다
private는 다른 클래스에서 사용하지 못한다
- open

- public

- internal

- fileprivate

- private

```swift
/***************************************************
 Open / Public
// public 같다 쓰는거
// open 받아서 덮어쓰는거. 원하는 구현내용을 작성할수 있다
 ***************************************************/

open class SomeOpenClass {
  open var name = "name"
  public var age = 20
}

public class SomePublicClass {
  public var name = "name"
  var age = 20
}

let someOpenClass = SomeOpenClass()
someOpenClass.name
someOpenClass.age

let somePublicClass = SomePublicClass()
somePublicClass.name
somePublicClass.age


/***************************************************
 Internal
// 기본값
// 생략 되어 있음
// 한파일에서 만든걸 다른 파일에서도 같다 쓸수있게 
 ***************************************************/

class SomeInternalClass {
  internal var name = "name"
  internal var age = 0
}

//class SomeInternalClass {
//  var name = "name"
//  var age = 0
//}


let someInternalClass = SomeInternalClass()
someInternalClass.name
someInternalClass.age


/***************************************************
 fileprivate
 ***************************************************/

class SomeFileprivateClass {
  fileprivate var name = "name"
  fileprivate var age = 0
}

let someFileprivateClass = SomeFileprivateClass()
someFileprivateClass.name
someFileprivateClass.age

/***************************************************
 fileprivate
 ***************************************************/

class SomePrivateClass {
  private var name = "name"
  private var age = 0
  
  func someFunction() {
    print(name)
  }
}

let somePrivateClass = SomePrivateClass()
somePrivateClass.someFunction()
somePrivateClass.name // error name에는 접근하지 못한다 
somePrivateClass.age // error age에는 접근하지 못한다 
// private는 다른 클래스 밖 에서 접근하지 못한다


/***************************************************
 1. Command Line Tool 로 체크
 2. UIViewController, Int 등 애플 프레임워크의 접근 제한자 확인
 ***************************************************/
```





## Nested Types

- Private -> Fileprivate // class	가  Private이면 내부는 Fileprivate

- Fileprivate -> Fileprivate. // class 자체가  Fileprivate 이면 내부에 프로퍼티들은 internel이 될수없다 // 해당 파일내에서는 다룰수 있다

- Internal -> Internal

- Public -> Internal

- Open -> Internal

// 일반적으로 프로퍼티나 메소드에 붙이곤 한다

```swift
// 별도로 명시하지 않으면 someProperty는 Internal 레벨
// public도 동일
open class OClass {
  var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 Internal 레벨
// 더 높은 레벨을 설정할 수는 있지만,
// 애초에 클래스 자체에 접근할 수 있는 레벨이 낮으므로 의미 없음
internal class IClass {
  open var openProperty = 0
  public var publicProperty = 0
  var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 fileprivate 레벨
fileprivate class FClass {
  var someProperty: Int = 0
}

// 별도로 명시하지 않으면 someProperty는 fileprivate 레벨
private class PClass {
  var someProperty: Int = 0
}
```



# **Getters and Setters**

```swift
/***************************************************
 Getter 와 Setter 는 그것이 속하는 변수, 상수 등에 대해 동일한 접근 레벨을 가짐
 이 때 Getter 와 Setter 에 대해서 각각 다른 접근 제한자 설정 가능
 ***************************************************/

/***************************************************
 Setter 설정
 ***************************************************/

class TrackedString {
//  var numberOfEdits = 0

//  private var numberOfEdits = 0
  private(set) var numberOfEdits = 0

  var value: String = "" {
    didSet {
      numberOfEdits += 1
    }
  }
}


let trackedString = TrackedString()
trackedString.numberOfEdits
trackedString.value = "This string will be tracked."
trackedString.numberOfEdits

trackedString.value += " This edit will increment numberOfEdits."
trackedString.numberOfEdits

trackedString.value = "value changed"
trackedString.numberOfEdits

//trackedString.numberOfEdits = 0
//trackedString.numberOfEdits


/***************************************************
 Getter 와 Setter 에 대해 각각 명시적으로 표현
 ***************************************************/

public class TrackedString1 {
  internal private(set) var numberOfEdits = 0
  
  public var value: String = "" {
    didSet {
      numberOfEdits += 1
    }
  }
  
  public init() {}
}
```









```swift
import Foundation



/***************************************************
 Internal
 ***************************************************/
print("\n---------- [ Internal ] ----------\n")

let internalClass = InternalClass()
print(internalClass.publicProperty)
print(internalClass.internalProperty)
print(internalClass.defaultProperty)
//print(internalClass.fileprivateProperty) // error 다른 파일에서는 사용 불가 
//print(internalClass.privateProperty) // class 내에서만 사용 가능


/***************************************************
 Fileprivate
// class	가 다르더라도 같은 파일내에서는 사용 가능
 ***************************************************/
print("\n---------- [ Fileprivate ] ----------\n")

//접근 불가
//let fileprivateClass = FileprivateClass() // error 해당파일 내에서만 사용하게끔 만들어서

let anotherClass = SameFileAnotherClass()
anotherClass.someFunction()


/***************************************************
 Private
 ***************************************************/
print("\n---------- [ Private ] ----------\n")

//접근 불가
//let privateClass = PrivateClass()

let someOtherClass = SomeOtherClass()
someOtherClass.someFunction()

```





```swift
import Foundation

class InternalClass {
  public var publicProperty = 1
  internal var internalProperty = 2
  fileprivate var fileprivateProperty = 3
  private var privateProperty = 4
  
  var defaultProperty = 5
}
```



```swift
import Foundation

fileprivate class FileprivateClass {
  public var publicProperty = 10
  internal var internalProperty = 20
  fileprivate var fileprivateProperty = 30
  private var privateProperty = 40
  
  var defaultProperty = 50
}


// 동일 파일 내에서는 fileprivate 클래스에 접근 가능
class SameFileAnotherClass {
  private let someProperty = FileprivateClass()

  func someFunction() {
    let fileprivateClass = FileprivateClass()
    print(fileprivateClass.publicProperty)
    print(fileprivateClass.internalProperty)
    print(fileprivateClass.fileprivateProperty)
//    print(fileprivateClass.privateProperty)  // 접근 불가
    
    print(fileprivateClass.defaultProperty)  // = fileprivate
  }
}
```



```swift
import Foundation

private class PrivateClass {
  public var publicProperty = 100
  internal var internalProperty = 200
  fileprivate var fileprivateProperty = 300
  private var privateProperty = 400
  
  // default 는 fileprivate 처럼 동작
  var defaultProperty = 500
  
  func someFileprivateFunction() {
  }
  private func somePrivateFunction() {
  }
}


class SomeOtherClass {
  // fileprivate 또는 private 으로 설정 필요
  fileprivate let privateClass = PrivateClass()
//  private let privateClass = PrivateClass()

  func someFunction() {
    let privateClass = PrivateClass()
    print(privateClass.publicProperty)
    print(privateClass.internalProperty)
    print(privateClass.fileprivateProperty)
//    print(privateClass.privateProperty)  // 접근 불가
    
    print(privateClass.defaultProperty)    // = fileprivate
    
    privateClass.someFileprivateFunction()
//    privateClass.somePrivateFunction()   // 접근 불가
  }
}


```




