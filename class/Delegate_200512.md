# **Delegate**

```
특정 로직을 내가 아닌 다른 객체가 대신 구현하도록 위임하는 형태의 디자인 패턴 요청하는 객체와 요청에 응답할 객체로 나누어 작성
주로 다음과 같은 상황에 사용
- 뷰가 받은 이벤트나 상태를 뷰컨트롤러에게 전달하여 처리 (View -> ViewController) - 뷰 구성에 필요한 정보를 뷰컨트롤러가 결정 (View <- ViewController)
- 주요 코드는 숨기고 특정 상황에 대해서만 커스터마이징 할 수 있도록 제공
```



## **Delegate protocol**

```swift
 protocol CustomViewDelegate: class {
func colorForBackground(_ newColor: UIColor?) -> UIColor
}
```



## **Delegate 선언**

```swift
final class CustomView: UIView {
weak var delegate: CustomViewDelegate?
override var backgroundColor: UIColor? {
get { return super.backgroundColor }
set {
let color = delegate?.colorForBackground(newValue) // 여기서 delegate는 ViewController의 주소값을 가지고있다 
let newColor = color ?? newValue ?? .gray
super.backgroundColor = newColor
print("새로 변경될 색은 :", newColor)
}
}
}
```



## **Delegate 구현부**

```swift
class ViewController: UIViewController,                    {
CustomViewDelegate
@IBOutlet weak var customView: CustomView!
override func viewDidLoad() {
super.viewDidLoad()
}
customView.delegate = self
func colorForBackground(_ newColor: UIColor?) -> UIColor {
guard let color = newColor else { return .gray }
return color == .green ? .blue : color
}
}
```



```
delegate

개발자한테 더하고 싶은게 있으면 여기서 하라고 커스터마이징 할 수 있는 기회를 재공해 주는것
```



```swift
class AppDelegate: UIResponder, UIApplicationDelegate { // delegate 채택
  
}
// UIApplicationDelegate 라는 프로토콜을 채택
//delegate는 모두 프로토콜로 만들어저 있다
```

