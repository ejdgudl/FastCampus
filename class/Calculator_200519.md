Calculator

```swift
//
//  ViewController.swift
//  Calculator_Stanford
//
//  Created by 김동현 on 2020/06/09.
//  Copyright © 2020 김동현. All rights reserved.
//
// 기본적인 UI(레이블과 버튼)들은 StoryBoard를 사용하여 작업 하였다.


import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private var display: UILabel! // 계산기 Display
    
    private var userIsInTheMiddleOfTyping = false
    // 숫자를 입력중일때는 계속 이어 붙혀 나갈거지만, 입력중이 아닐때는 숫자를 입력하면 디스플레이에 무엇이 있었든 누른 숫자로 바꿔 줘야 하기때문에 변수를 Bool타입으로 지정을 해주어서 판단하게끔 만들었다.
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle! // 버튼을 눌렀을때 각 버튼의 title을 변수에 담아놓는다.
        if userIsInTheMiddleOfTyping == true { // 입력중이라면 이어서 숫자가 나오게 하는 코드
            let textCurrntlyInDisplay = display.text
            display.text = textCurrntlyInDisplay! + digit
        } else {
            display.text = digit // 입력중이 아니면 누른 숫자만 나오게끔 하는 코드
        }
        userIsInTheMiddleOfTyping = true // true 나 false 이거나 둘다 입력을 어쨋든 하는것이기 때문에 true로 마지막에 바꿔준다
    } // 숫자 버튼을 눌렀을때의 IBAction
    
    private var displayValue: Double {
        get {
            Double(display.text!)!
        } // display의 값을 가저오기 위한 코드
        set (newValue) {
            display.text = String(newValue)
        } // display의 값을 설정하기 위한 코드
    } // display에 있었던 숫자를 기억하는 동시에 설정할수 있는 연산 프로퍼티.
    // get 구문에서는 display의 Double 타입 값을 가지고 있을 꺼고
    // set 구문에서는 display의 값을 double 타입의 값으로 set 해줄것이다.
    // 일일이 Double 타입의 값을 Label에 띄어줄때 String 타입으로 변환하지 않을수 있고,
    // 또는 Label에 띄어져 있던 String 타입의 값을 계산을 하기 위해 Double 타입의 값으로 변환하지 않을수 있게
    // 할수있는 연산 프로퍼티이다.
    
    private var brain = CalculatorBrain() // model 파일의 인스턴스 생성
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping == true {
            brain.setOperand(operand: displayValue) // 연산기호를 눌렀을때 숫자를 입력중이었던 상태라면 model파일의 setOperand함수를 실행시키고 인자값으로 현재 displayValue를 보낸다.
            userIsInTheMiddleOfTyping = false
        }
        
        if let matheMatiacalSymbol = sender.currentTitle { // 상수 하나를 선언하고 그곳에 버튼의 타이틀이 들어온다고 했을때
            brain.performOperation(symbol: matheMatiacalSymbol)
            // 모델의 performOperation 함수를 실행 시키고 인자값으로 받는 symbol에 matheMatiacalSymbol 의 값을 보낸다
        }
        displayValue = brain.result
    } // 연사 기호를 눌렀을때의 IBAction
}




/*
 if matheMatiacalSymbol == "π" {
 displayValue = M_PI
 } else if matheMatiacalSymbol == "√" {
 displayValue = sqrt(displayValue)
 }
 */
```



```swift
//
//  CalculatorBrain.swift
//  Calculator_Stanford
//
//  Created by 김동현 on 2020/06/09.
//  Copyright © 2020 김동현. All rights reserved.
//
// MVC 패턴에서 Model의 역할을 할 파일이다.
// Model 파트에서는 Foundation 을 import 한다.
import Foundation

class CalculatorBrain {
    
    private var accumulator: Double = 0.0 // 연산이 수행됨에 따라 결과를 쌓아갈것임
    
    func setOperand(operand: Double) {
        accumulator = operand // 인자값으로 들어오는 operand를 accumulator의 값으로 설정한다
    } // 피연산자 설정
    
    var operations: Dictionary<String, operation> = [
        "π" : operation.Constant(M_PI),
        "e" : operation.Constant(M_E),
        "√" : operation.UnaryOperation(sqrt),
        "cos" : operation.UnaryOperation(cos),
        "×" : operation.BinaryOperation({$0 * $1}),
        "÷" : operation.BinaryOperation({$0 / $1}),
        "+" : operation.BinaryOperation({$0 + $1}),
        "-" : operation.BinaryOperation({$0 - $1}),
        "=" : operation.Equals
    ] // Dictionary타입에 변수에 String 타입의 연산기호들을 Key로 설정해놓고
      // enum으로 설정해놓은 타입들의 case를 Value로 설정해 놓았다
      // 또한 각 case들의 연관값들도 설정해놓았다.
    
    enum operation {
        case Constant(Double) // 상수
        case UnaryOperation((Double) -> Double) // 단항연산
        case BinaryOperation((Double, Double) -> Double) // 이항연산
        case Equals // =
    } // 연산 타입들을 Enum으로 나열해놓았다. 그리고 각 case 들의 연관값의 타입들을 지정해놓았다.
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value): // value는 Double타입의 연관값
                accumulator = value
            case .UnaryOperation(let function): // function은 (Double) -> Double
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                excutePendingBynaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                excutePendingBynaryOperation()
            }
        }
    } // 피연산자를 연산
    // 인자값으로 들어오는 symbol에 switch 구문을 적용한것이다.
    // 여기서 symbol은 matheMatiacalSymbol, 즉 button의 currentTitle
    
    private func excutePendingBynaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: ((Double, Double) -> Double)
        var firstOperand : Double
    } // 대기중인 이항연산 정보
    
    var result: Double {
        get {
            return accumulator // result는 항상 현재 상태의 accumulator 값이 될거다.
        }
    } // 읽기 전용 연산프로퍼티
    
}
```

