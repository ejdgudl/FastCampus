# textField 

```swift
textFieldEditingDidbegin // 텍스트 필드가 나타날때

textFieldEditingChanged // 무언가를 치면 호출

textFieldDidEndOnExit // 리턴을 누르면 호출(1)

textFieldPrimaryActionTriggered// 리턴을 누르면 호출(2), 텍스트필드의 주요 액션

textFieldEditingDidEnd// 리턴을 누르면 호출(3) 
```



```swift
self.uiTextField1.placeholder = " "
self.uiTextField1.font = UIFont.boldSystemFont(ofSize: 10)
self.uiTextField1.textAlignment = .center
self.uiTextField1.keyboardType = .numberPad
self.uiTextField1.tintColor = .clear
self.uiWrap.addSubview(uiTextField1)
```





```swift
extension viewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func setKeyboardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillAppear(_ sender: NotificationCenter) {
        view.constant = -240
    }
    
    @objc func keyboardWillDisappear(_ sender: NotificationCenter) {
        view.constant = -40
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}
```

