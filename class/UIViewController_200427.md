# UIViewController

### **The Role of View Controllers**

```
앱 구조의 뼈대
모든 앱에 반드시 하나 이상, 대부분 많은 수의 ViewController로 구성
```

주요 역할

- View Management
- Data Marshaling
- User Interactions
- Resource Management
- Adaptivity

### **View Management**

```
주요 역할 - 뷰 계층 관리
모든 뷰컨트롤러마다 RootView를 지니며, 화면에 표시하기 위해서는 해당 RootView계층에 속해야 함
```



### **Two types of view controllers**

```
Content View Controllers
- 모든 뷰를 단독으로 관리
- UIViewController, UITableViewController, UICollectionViewController 등
```

```
Containter View Controllers
- 자체 뷰 + 하나 이상의 자식 뷰 컨트롤러가 가진 루트뷰 관리
- 각 컨텐츠를 관리하는 것이 아닌 루트뷰만 관리 하며 컨테이너 디자인에 따라 크기 조정
- UINavigationController, UITabbarController, UIPageViewController 등
```



### **Data Marshaling**

```
MVC (Model - View - Controller)
자신이 관리하는 View 와 Data 간 중개 역할
```



### **User Interactions**

```
이벤트 처리
- 뷰컨트롤러는 Responder 객체 : 직접 이벤트를 받아 처리 가능하나 일반적으로 지양
- 뷰가 그 자신의 터치 이벤트를 연관된 객체에 action 메서드나 delegate로 전달
```



### **Resource Management**

```
뷰컨트롤러가 생성한 모든 뷰와 객체들은 뷰컨트롤러의 책임
뷰컨트롤러의 생명 주기에 따라 생성되었다가 자동 소멸되기도 하지만 ARC 개념에 맞게 관리 필요
메모리 부족시 didReceiveMemoryWarning 메서드에서 꼭 유지하지 않아도 자원들은 정리 필요
```



### **Adaptivity**

```
뷰컨트롤러는 뷰의 표현을 책임지고 현재 환경에 적절한 방법으로 적용되도록 할 책임을 가짐
```





### **The Root View Controller**

```
UIWindow는 그자체로는 유저에게 보여지는 컨텐츠를 가지지 못함
Window는 정확히 하나의 Root View Controller 를 가지는데 이것을 통해 컨텐츠를 표현
```





![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-27%20%EC%98%A4%ED%9B%84%203.32.28.png?raw=true)

![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-28%20%EC%98%A4%EC%A0%84%2012.06.56.png?raw=true)

![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-28%20%EC%98%A4%EC%A0%84%2012.07.03.png?raw=true)

![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-28%20%EC%98%A4%EC%A0%84%2012.07.10.png?raw=true)



### present

```swift
let nextVC = NextViewController()
present(nextVC, animated: true)

// 올라올 다음 뷰컨트롤러의 인스턴스를 가지고 온후에 present 해준다

dismiss(animated: true)

// 다시 돌아올려면 dissmiss해준다

let nextVC = NextViewController()
nextVC.modalPresentationStryle = .fullScreen
present(nextVC, animated: true)

// fullScreen 방식


presentingViewController? - 나를 띄운 ViewController // 나를 띄운놈이 있을수도 있고 없을수도 있어서 Optional
presentedViewController? - 내가 띄운 ViewController


if let vc = presentingViewController as? ViewContoller {
  vc.button1.setTitle("d", for: .normal)
}
// 만약 dismiss할때 전화면에 버튼 같은거에 접근할때는 UIViewController 안에는 버튼같은게 없기 때문에 그 버튼이 있는 화면(전화면)인 ViewController로 타입 캐스팅을 해줘야한다. 컴파일러는 ViewController라는 건 모르고 UIViewController 라는 타입이라는건 알고있기 때문에 

isModalInPresentation 은 Bool 타입이며 카드 타입이 닫히게 할수도 있고 안닫히게 할수도 있다
// toggle -> 반전

```



### window설정

```swift
SceneDelegate
window = UIWindow(windowScene: windowScene)
window?.rootViewController = ViewController()
window?.backgroundColor = .systemBackground
window?.makeKeyAndVisible()


if #available(iOS 13, *) {
    
} else {
    var window: UIWindow? // 함수 밖으로
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = ViewController()
    window?.backgroundColor = .systemBackground
    window?.makeKeyAndVisible()
}
// if문 안쪽은 13 이상일때 그게 아니면 else문
// 즉 13 부터는 SceneDelgate로
// SceneDelegate 안 쓸때
// 1. SceneDelegate 삭제
// 2. AppDelegate 밑에 MARK: UISceneSession Lifecycle 부분 삭제
// 3. info.plist에서 Appllication Scene Manifest부분에 - 버튼 눌러 삭제


```

