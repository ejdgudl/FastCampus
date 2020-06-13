# **Autolayout Anchors**

```
iOS 9.0 이상에서 사용 가능
```



```swift
subview.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
```



## **Horizontal Layout Anchors**

```
View 의 수평선, X축에 관련된 제약조건 NSLayoutXAxisAnchor 클래스의 객체
```

- Leading anchor
- Training anchor
- left anchor
- Right anchor
- Center-X anchor



## **Vertical Layout Anchors**

```
View 의 수직선, Y축에 관련된 제약조건 
NSLayoutYAxisAnchor 클래스의 객체
```

- Top anchor
- Bottom anchor
- Center-Y anchor
- First baseline anchor
- Last baseline anchor



## **Dimension Layout Anchors**

```
View 의 크기 정의 
NSLayoutDimension 클래스의 객체
```

- Width anchor
- height anchor





```swift
//
//  ViewController.swift
//  AutoLayoutByCode
//
//  Created by giftbot on 2020. 05. 18..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  private let firstView = UIView()
  private let secondView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    firstView.backgroundColor = .darkGray
    secondView.backgroundColor = .green
    
    view.addSubview(firstView)
    firstView.addSubview(secondView)
    
    
    setupAutoresizingMask()
    
//    activateLayoutAnchors()
    
    
    // NSLayoutConstraint, VisualFormat 참고용
//    activateNSLayoutConstraintConstraints()
//    activateVisualFormat()
  }
  
  
  // MARK: AutoresizingMask
  
  private func setupAutoresizingMask() {
    // Width, Height
    // TopMargin, LeftMargin, BottomMargin, RightMargin
    
    firstView.frame = CGRect(
      x: 50, y: 50,
      width: view.frame.width - 100, height: view.frame.height - 100
    )
    secondView.frame = CGRect(
      x: 40, y: 40,
      width: firstView.frame.width - 80, height: firstView.frame.height - 80
    )
    
    
    // 기본값 []
//    firstView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//    secondView.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin]
    
    // 수퍼뷰의 위치나 크기가 변했을 때 서브뷰의 변화 확인
    firstView.frame = CGRect(
      x: 50, y: 100,
      width: 200, height: 200
    )
    
//    firstView.frame.size.width = 250
//    firstView.frame.size.height = 400
  }
  
  
  // MARK: AutoLayoutAnchors

  private func activateLayoutAnchors() {
    /***************************************************
     iOS 9.0 이상에서 사용 가능
     
     view.topAnchor - 뷰에 설정 시
     view.safeAreaLayoutGuide.topAnchor - SafeArea에 설정 시
     ***************************************************/
    
    
    // isActive를 통한 제약조건 활성화
    // 단순히 똑같이 만들때 TopAnchor랑 딱 붙을때// TopAnchor에서 몇 만큼 내려간 위치
    firstView.translatesAutoresizingMaskIntoConstraints = false
    firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    
    
    // activate를 통한 제약조건 활성화
    secondView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      secondView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 40),
      secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 40),
      secondView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -40),
      secondView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -40),
      secondView.heightAnchor.constraint(equalToConstant: 100) // 높이값 설정
    ])
  }
}
```



```swift
//
//  ViewController.swift
//  test
//
//  Created by 김동현 on 2020/06/13.
//  Copyright © 2020 김동현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let margin:CGFloat = 20
    let view1 = UIView()
    let view2 = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = .red
        view2.backgroundColor = .blue
        view.addSubview(view1)
        view.addSubview(view2)
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
            view1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -margin),
            view1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin),
            view1.trailingAnchor.constraint(equalTo: view2.leadingAnchor, constant: -10),
            
            view2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
            view2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -margin),
            view2.leadingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 10),
            view2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
            
            view1.widthAnchor.constraint(equalTo: view2.widthAnchor, multiplier: 1)
        ])
        
    }

    
    

}


```





## Intrinsic Content Size

```
고유의 콘텐츠 크기 (컨텐츠를 잘라내거나 줄이지 않고도 온전히 표현할 수 있는 최소한의 공간)
뷰에 따라 다른 형태를 가질 수 있음
레리아웃 작업시 이 사이즈를 통해 제약 조건을 자동 생성하여 적용
```

```
Intrinsic Size 􏰁 􏰞􏰟 􏰠􏰡􏰜􏰝
- Content Hugging : 􏰢 􏰈􏰐 􏰣􏰖􏰤􏰥 􏰦􏰧􏰨􏰩 􏰪􏰫 􏰬􏰠􏰭 􏰂􏰮
- Content Compression Resistance : 􏰢 􏰈􏰐 􏰯􏰖􏰰􏰥 􏰦􏰧􏰨􏰩 􏰪􏰱 􏰬􏰠􏰭 􏰂􏰮
```



## **Priority**

각각의 제약 조건은 1~1000 사이의 우선 순위를 가짐

Required(1000), Hight(750), Low(250)

상충되는 제약조건이 적용되어 있다면 우선순위가 높은것으로 적용



## **Programmatically**

```swift
UILayoutPriority(900)
UILayoutPriority(800)
UILayoutPriority.required UILayoutPriority.defaultHigh UILayoutPriority.defaultLow
// 1000
// 750
// 250
UILayoutPriority.dragThatCanResizeScene UILayoutPriority.sceneSizeStayPut UILayoutPriority.dragThatCannotResizeScene // 490 UILayoutPriority.fittingSizeLevel // 50



// set
view.setContentHuggingPriority(.defaultHigh, for: .horizontal) view.setContentCompressionResistancePriority(.required, for: .vertical)
// get
view.contentHuggingPriority(for: .horizontal) view.contentCompressionResistancePriority(for: .vertical)
```





