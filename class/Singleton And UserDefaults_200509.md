# **Singleton**

- 특정 클래스의 인스턴스에 접근할 때 항상 동일한 인스턴스만을 반환하도록 하는 설계 패턴

- 한 번 생성된 이후에는 프로그램이 종료될 때까지 항상 메모리에 상주

- 어플리케이션에서 유일하게 하나만 필요한 객체에 사용

- UIApplication, AppDelegate 등

```swift
/*
 iOS 싱글톤 사용 예
 */
let screen = UIScreen.main
let userDefaults = UserDefaults.standard
let application = UIApplication.shared
let fileManager = FileManager.default
let notification = NotificationCenter.default

// 하나만 만들어서 공유해서 사용할 얘들
```



```swift
class NormalClass {
  var x = 0
}

// 생성자를 통해서 인스턴스 생성하고 프로퍼티에 값을넣었다
let someObject1 = NormalClass()
someObject1.x = 5

let someObject2 = NormalClass()
someObject2.x = 1

let someObject3 = NormalClass()
someObject3.x = 10

someObject1.x // 5
someObject2.x // 1
someObject3.x // 10



/*
 static 전역 변수로 선언한 것은 지연(lazy) 생성되므로
 처음 Singleton을 생성하기 전까지 메모리에 올라가지 않음
 */

class SingletonClass {
  static let shared = SingletonClass() // 자기타입 자체를 자기 클래스 안에서 객체 생성
  var x = 0 
}
// static - 타입 프로퍼티 
// 타입자체이서 . 찍고 접근
// 인스턴스 생성하는게 아니고 


let singleton1 = SingletonClass.shared // 객체생성됨
singleton1.x = 10 // 10

let singleton2 = SingletonClass.shared
singleton2.x = 20 // 20

singleton1.x   // 20
singleton2.x   // 20 

SingletonClass.shared.x = 30

SingletonClass.shared.x  // 30
singleton1.x  // 30
singleton2.x  // 30



// 싱글톤을 사용하는 것과 같은 개념
let someVar1 = NormalClass()
someVar1.x = 10
let someVar2 = someVar1
someVar2.x = 20

someVar1.x //
someVar2.x //



// 다음 코드의 결과는?
SingletonClass().x = 99
SingletonClass().x   // 99
singleton1.x  // 30
singleton2.x  // 30




/*
 Q.
 항상 하나의 객체만을 사용하는 것을 보장해야 하는 상황에서
 아래와 같은 싱글톤 클래스를 만들었는데, 현재 상태에서 생길 수 있는 문제점은?
 */

class MySingleton {
  static let shared = MySingleton()
  var x = 0
  
  private init() {} // 추가 생성자를 막을수 있음
}

let object1 = MySingleton.shared
let object2 = MySingleton() // 더이상 객체 생성이 되면안된다
let object3 = MySingleton()






// 여전히 새로운 객체를 만들고 다른 객체에 접근 가능

let object2 = MySingleton()
object1.x = 10
object2.x = 20

object1.x
object2.x




/*
 외부에서 인스턴스를 직접 생성하지 못하도록 강제해야 할 경우 생성자를 private 으로 선언
 단, 일부러 새로운 것을 만들어서 쓸 수 있는 여지를 주고 싶은 경우는 무관
 */

class PrivateSingleton {
  static let shared = PrivateSingleton()
  private init() {}
  var x = 1
}

//let uniqueSingleton = PrivateSingleton.init()
let uniqueSingleton1 = PrivateSingleton.shared
let uniqueSingleton2 = PrivateSingleton.shared
uniqueSingleton1.x
uniqueSingleton2.x

uniqueSingleton1.x = 20

uniqueSingleton1.x
uniqueSingleton2.x

```





# User Defauls

- 데이터 저장소
- UserDefaults를 사용하면 앱의 어느 곳에서나 데이터를 쉽게 읽고 저장할 수 있게된다
- 사용자 기본 설정과 같은 단일 데이터 값에 적합
-  [데이터, 키(key)]으로 데이터를 저장

```swift
var textfiled1 = UITextField()
var label1 = UILabel()
label.text = "asd"


UserDefaults.standard.set(textfiled1.text?, forKey: "keyname")
// keyname 이라는 곳에 textfiled1.text 가 저장된다


label1.text = UserDefaults.standard.string(forKey: "keyname") 
// label1 의 text는 textfiled1에 입력된 문자가 띄어진다
```



