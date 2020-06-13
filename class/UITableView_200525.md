# **UITableView**

```
UIScrollView 를 상속받아 리스트 형태로 반복되는 아이템을 보여주기 위한 뷰 
Plain Style / Grouped Style
```

**Plain Table Views**

- 기본 스타일
-  하나 이상의 섹션을 가질 수 있으며  
-  각 섹션은 다시 하나 이상의 로우를 가짐 각 섹션은 그 자신의 헤더/푸터 뷰를  가질 수 있고 해당 섹션이 보여질 때   헤더뷰는 Top, 푸터뷰는 Bottom 에 고정 
-  섹션을 빠르게 검색할 수 있도록   Indexed List 를 설정 가능



**Grouped Table Views**

- 관련된 아이템들을 하나의 그룹으로 그룹핑
- 데이터 계층 구조에 대한 상세 정보를 표현 하는 데 적합한 형태
- Plain 스타일과 달리 헤더뷰와 푸터뷰가  Top, Bottom 에 고정되지 않음



## **UITableViewDataSource**

```
TableView 에서 표현할 데이터를 제공하는 데 사용하는 프로토콜
```



```swift
func tableView(
_ tableView: UITableView, numberOfRowsInSection section: Int
) -> Int {
// 섹션별 row 갯수 }
func tableView(
_ tableView: UITableView, cellForRowAt indexPath: IndexPath
) -> UITableViewCell {
// UITableViewCell 커스터마이징 }
```









## **UITableViewDelegate**

```swift
Interaction 과 관련된 동작을 커스터마이징하는 프로토콜
```



## **UITableViewCell**

```
TableView 에서 사용하는 각 아이템을 담는 컨테이너
반복되는 셀을 매번 생성, 해제, 재할당하는 부담을 덜기 위해 화면에 보여지지 않는 부분의 셀을 재사용
```

**Storyboard**

- TableView 를 뷰에 올린 후   오토레이아웃 적용
- TableViewCell 을 TableView 에 추가



## **UITableViewCell Identifier**

```
각 Cell 을 구분해서 재사용하기 위한 식별자
```









#### 디버그 창에서..

```swift
디버그창에서
po indexPath 를 입력하면 
- 0 : 0
- 1 : 1
가 나오는데
section과 row의 값, 즉 indexPath의 값이 나타난다

po -> print object 의 약자
```



```swift
//
//  TableViewBasic.swift
//  BasicTableView
//
//  Created by Giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewBasic: UIViewController {
  
  override var description: String { "TableView - Basic" }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    view.addSubview(tableView)
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    // UITableViewCell 타입 정보 자체를 넘겨줄때 .self.    CellId로 해가지고 UITableViewCell 클래스로 만드는 어떤 인스턴스를 나중에 생성할꺼야 라고 알려주는 역할
  }
}


// MARK: - UITableViewDataSource
extension TableViewBasic: UITableViewDataSource {
    
    // let <#TableViewName#> = UITableView()
    // <#TableViewName#>.dataSource = self
    // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    // UITableViewCell 타입 정보 자체를 넘겨줄때 .self.
    // CellId로 해가지고 UITableViewCell 클래스로 만드는 어떤 인스턴스를 나중에 생성할꺼야 라고 알려주는 역할
    
    
    
    // 미리 셀을 등록
    // 하나의 section에 row를 몇개 넣을 것인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    
    // indexPath 에는 몇번째 section인지 와 몇번째 row 인지에 대한 정보가 담겨있다
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "<#CellId#>", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}

```







```swift
// MARK: - UITableViewDelegate
extension <#ViewControllerName#>: UITableViewDelegate {
    
    //<#TableViewName#>.delegate = self
    //<#TableViewName#>.allowsMultipleSelection = true
    //<#TableViewName#>.indexPathForSelectedRow -> Keyward
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        <#code#>
    }
}

// MARK: - UITableViewDataSource
extension <#ViewControllerName#>: UITableViewDataSource {
    
    let <#TableViewName#> = UITableView()
    <#TableViewName#>.dataSource = self
    <#TableViewName#>.register(UITableViewCell.self, forCellReuseIdentifier: "<#CellID#>")
    <#TableViewName#>.rowHeight = UITableView.automaticDimension
    view.addSubview(<#TableViewName#>)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "<#CellID#>", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
// MARK: - ReloadData
//let refreshControl = UIRefreshControl()
//refreshControl.tintColor = .<#color#>
//refreshControl.addTarget(self, action: #selector(reloadData), for: .<#event#>)
//refreshControl.attributedTitle = NSAttributedString(string: "<#string#>")
//<#TableViewName#>.refreshControl = refreshControl
//
//let attrstr = NSAttributedString(string: "<#string#>", attributes: [
//    .font: UIFont.systemFont(ofSize: <#size#>),
//    .foregroundColor: UIColor.<#color#>,
//    .kern: <#자간#>
//    ])
//
//@objc func reloadData() {
//  <#TableViewName#>.refreshControl?.endRefreshing()
//  <#TableViewName#>.reloadData()
//}
// MARK: - Section Case
//lazy var sectionTitles: [String] = <#DictName#>.keys.sorted()
//let <#DictName#> = [
//    "<#  #>": [<#  #>, <#  #>],
//    "<#  #>": [<#  #>, <#  #>]
//]

//func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return fruitsDict[sectionTitles[section]]!.count
//    <#DictName#>[sectionTitles[section]]!.count
//}

//func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
//
//    let <#rowTexts#> = fruitsDict[sectionTitles[indexPath.section]]!
//    cell.textLabel?.text = "\(<#rowTexts#>[indexPath.row])"
//    return cell
//}


```

