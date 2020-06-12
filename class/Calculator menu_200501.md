# Calculator_menu

```swift

import UIKit

class ViewController: UIViewController {
    
    var jajangCount = 0
    var jambongCount = 0
    var tangsuCount = 0
    var myMoneyWon = 70000
    var payMoneyWon = 0
    
    var jajangCountLabel = UILabel()
    var jambongCountLabel = UILabel()
    var tangsuCountLabel = UILabel()
    var containerView = UIView()
    var menu = UILabel()
    var price = UILabel()
    var count = UILabel()
    var jajang = UILabel()
    var jambong = UILabel()
    var Tangsu = UILabel()
    var jajangPrice = UILabel()
    var jambongPrice = UILabel()
    var TangsuPrice = UILabel()
    var btnOrder1 = UIButton()
    var btnOrder2 = UIButton()
    var btnOrder3 = UIButton()
    var myMoney = UILabel()
    var payMoney = UILabel()
    var myMoneyWonLabel = UILabel()
    var payMoneyWonLabel = UILabel()
    var btnReset = UIButton()
    var btnPay = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContainerView()
        setupMenu()
        setupPrice()
        setupCount()
        setupJajang()
        setupJambong()
        setupTangsu()
        setupJajangPrice()
        setupJambongPrice()
        setupTangsuPrice()
        setupJajangCountLabel()
        setupJambongCountLabel()
        setupTangsuCountLabel()
        setupBtnOrder1()
        setupBtnOrder2()
        setupBtnOrder3()
        setupMyMoney()
        setupPayMoney()
        setupMyMoneyWonLabel()
        setupPayMoneyWonLabel()
        setupBtnReset()
        setupBtnPay()
    }
    
    func setupContainerView() {
        containerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(containerView)
    }
    func setupMenu() {
        menu.text = "메뉴"
        menu.textAlignment = .center
        menu.frame = CGRect(x: 40, y: 70, width: 40, height: 30)
        containerView.addSubview(menu)
    }
    func setupPrice() {
        price.text = "가격"
        price.textAlignment = .center
        price.frame = CGRect(x: 130, y: 70, width: 40, height: 30)
        containerView.addSubview(price)
    }
    func setupCount() {
        count.text = "수량"
        count.textAlignment = .center
        count.frame = CGRect(x: 210, y: 70, width: 40  , height: 30)
        containerView.addSubview(count)
    }
    func setupJajang() {
        jajang.text = "짜장면"
        jajang.backgroundColor = .cyan
        jajang.textAlignment = .center
        jajang.frame = CGRect(x: 20, y: 130, width: 80, height: 40)
        containerView.addSubview(jajang)
    }
    func setupJambong() {
        jambong.text = "짬뽕"
        jambong.backgroundColor = .cyan
        jambong.textAlignment = .center
        jambong.frame = CGRect(x: 20, y: 200, width: 80, height: 40)
        containerView.addSubview(jambong)
    }
    func setupTangsu() {
        Tangsu.text = "탕수육"
        Tangsu.backgroundColor = .cyan
        Tangsu.textAlignment = .center
        Tangsu.frame = CGRect(x: 20, y: 270, width: 80, height: 40)
        containerView.addSubview(Tangsu)
    }
    func setupJajangPrice() {
        jajangPrice.text = "5000원"
        jajangPrice.textAlignment = .center
        jajangPrice.frame = CGRect(x: 110, y: 130, width: 80, height: 40)
        containerView.addSubview(jajangPrice)
    }
    func setupJambongPrice() {
        jambongPrice.text = "6000원"
        jambongPrice.textAlignment = .center
        jambongPrice.frame = CGRect(x: 110, y: 200, width: 80, height: 40)
        containerView.addSubview(jambongPrice)
    }
    func setupTangsuPrice() {
        TangsuPrice.text = "12000원"
        TangsuPrice.textAlignment = .center
        TangsuPrice.frame = CGRect(x: 110, y: 270, width: 80, height: 40)
        containerView.addSubview(TangsuPrice)
    }
    func setupJajangCountLabel() {
        jajangCountLabel.text = "\(jajangCount)"
        jajangCountLabel.textAlignment = .center
        jajangCountLabel.frame = CGRect(x: 210, y: 130, width: 40, height: 40)
        containerView.addSubview(jajangCountLabel)
    }
    func setupJambongCountLabel() {
        jambongCountLabel.text = "\(jambongCount)"
        jambongCountLabel.textAlignment = .center
        jambongCountLabel.frame = CGRect(x: 210, y: 200, width: 40, height: 40)
        containerView.addSubview(jambongCountLabel)
    }
    func setupTangsuCountLabel() {
        tangsuCountLabel.text = "\(tangsuCount)"
        tangsuCountLabel.textAlignment = .center
        tangsuCountLabel.frame = CGRect(x: 210, y: 270, width: 40, height: 40)
        containerView.addSubview(tangsuCountLabel)
    }
    func setupBtnOrder1() {
        btnOrder1.setTitle("주문", for: .normal)
        btnOrder1.backgroundColor = .yellow
        btnOrder1.setTitleColor(.blue, for: .normal)
        btnOrder1.frame = CGRect(x: 270, y: 130, width: 80, height: 40)
        btnOrder1.addTarget(self, action: #selector(didTapBtnOrder1), for: .touchUpInside)
        containerView.addSubview(btnOrder1)
    }
    @objc func didTapBtnOrder1(_ sender: Any) {
        if payMoneyWon >= myMoneyWon || payMoneyWon + 5000 > myMoneyWon {
            let alert = UIAlertController(title: "알림", message: "한도 초과입니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: { (_) in
                self.payMoneyWon = 0
                self.payMoneyWonLabel.text = "\(self.payMoneyWon)원"
                self.jajangCountLabel.text = "0"
                self.jambongCountLabel.text = "0"
                self.tangsuCountLabel.text = "0"
            })
            present(alert, animated: true)
            alert.addAction(ok)
        } else {
        jajangCount += 1
        jajangCountLabel.text = "\(jajangCount)"
        payMoneyWon += 5000
        payMoneyWonLabel.text = "\(payMoneyWon)원"
        }
    }
    func setupBtnOrder2() {
        btnOrder2.setTitle("주문", for: .normal)
        btnOrder2.backgroundColor = .yellow
        btnOrder2.setTitleColor(.blue, for: .normal)
        btnOrder2.frame = CGRect(x: 270, y: 200, width: 80, height: 40)
        btnOrder2.addTarget(self, action: #selector(didTapBtnOrder2), for: .touchUpInside)
        containerView.addSubview(btnOrder2)
    }
    @objc func didTapBtnOrder2(_ sender: Any) {
        if payMoneyWon >= myMoneyWon || payMoneyWon + 6000 > myMoneyWon {
                let alert = UIAlertController(title: "알림", message: "한도 초과입니다.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: { (_) in
                    self.payMoneyWon = 0
                    self.payMoneyWonLabel.text = "\(self.payMoneyWon)원"
                    self.jajangCountLabel.text = "0"
                    self.jambongCountLabel.text = "0"
                    self.tangsuCountLabel.text = "0"
                })
                present(alert, animated: true)
                alert.addAction(ok)
        }
        else {
            jambongCount += 1
            jambongCountLabel.text = "\(jambongCount)"
            payMoneyWon += 6000
            payMoneyWonLabel.text = "\(payMoneyWon)원"
            }
    }
    func setupBtnOrder3() {
        btnOrder3.setTitle("주문", for: .normal)
        btnOrder3.backgroundColor = .yellow
        btnOrder3.setTitleColor(.blue, for: .normal)
        btnOrder3.frame = CGRect(x: 270, y: 270, width: 80, height: 40)
        btnOrder3.addTarget(self, action: #selector(didTapBtnOrder3), for: .touchUpInside)
        containerView.addSubview(btnOrder3)
    }
    @objc func didTapBtnOrder3(_ sender: Any) {
        if payMoneyWon >= myMoneyWon || payMoneyWon + 12000 > myMoneyWon {
                let alert = UIAlertController(title: "알림", message: "한도 초과입니다.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: { (_) in
                    self.payMoneyWon = 0
                    self.payMoneyWonLabel.text = "\(self.payMoneyWon)원"
                    self.jajangCountLabel.text = "0"
                    self.jambongCountLabel.text = "0"
                    self.tangsuCountLabel.text = "0"
                })
                present(alert, animated: true)
                alert.addAction(ok)
            } else {
            tangsuCount += 1
            tangsuCountLabel.text = "\(tangsuCount)"
            payMoneyWon += 12000
            payMoneyWonLabel.text = "\(payMoneyWon)원"
            }
    }
    func setupMyMoney() {
        myMoney.text = "소지금액"
        myMoney.textAlignment = .center
        myMoney.backgroundColor = .green
        myMoney.frame = CGRect(x: 20, y: 350, width: 80, height: 40)
        containerView.addSubview(myMoney)
    }
    func setupPayMoney() {
        payMoney.text = "결제금액"
        payMoney.textAlignment = .center
        payMoney.backgroundColor = .orange
        payMoney.frame = CGRect(x: 20, y: 400, width: 80, height: 40)
        containerView.addSubview(payMoney)
    }
    func setupMyMoneyWonLabel() {
        myMoneyWonLabel.text = "\(myMoneyWon)원"
        myMoneyWonLabel.textAlignment = .right
        myMoneyWonLabel.backgroundColor = .green
        myMoneyWonLabel.frame = CGRect(x: 110, y: 350, width: 140, height: 40)
        containerView.addSubview(myMoneyWonLabel)
    }
    func setupPayMoneyWonLabel() {
        payMoneyWonLabel.text = "\(payMoneyWon)원"
        payMoneyWonLabel.textAlignment = .right
        payMoneyWonLabel.backgroundColor = .orange
        payMoneyWonLabel.frame = CGRect(x: 110, y: 400, width: 140, height: 40)
        containerView.addSubview(payMoneyWonLabel)
    }
    func setupBtnReset() {
        btnReset.setTitle("초기화", for: .normal)
        btnReset.backgroundColor = .black
        btnReset.frame = CGRect(x: 270, y: 350, width: 80, height: 40)
        btnReset.addTarget(self, action: #selector(didTapBtnReset), for: .touchUpInside)
        containerView.addSubview(btnReset)
    }
    @objc func didTapBtnReset(_ sender: Any) {
        jajangCount = 0
        jajangCountLabel.text = "\(jajangCount)"
        jambongCount = 0
        jambongCountLabel.text = "\(jambongCount)"
        tangsuCount = 0
        tangsuCountLabel.text = "\(tangsuCount)"
        myMoneyWon = 70000
        myMoneyWonLabel.text = "\(myMoneyWon)원"
        payMoneyWon = 0
        payMoneyWonLabel.text = "\(payMoneyWon)원"
    }
    func setupBtnPay() {
        btnPay.setTitle("결제", for: .normal)
        btnPay.backgroundColor = .black
        btnPay.frame = CGRect(x: 270, y: 400, width: 80, height: 40)
        btnPay.addTarget(self, action: #selector(didTapBtnPay), for: .touchUpInside)
        containerView.addSubview(btnPay)
    }
    @objc func didTapBtnPay(_ sender: Any) {
        let alert = UIAlertController(title: "결제 확인", message: "\(payMoneyWon)원을 결제 하시겠습니까?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "결제", style: .default) { (_) in
            self.myMoneyWon -= self.payMoneyWon
            self.myMoneyWonLabel.text = "\(self.myMoneyWon)원"
            self.jajangCount = 0
            self.jajangCountLabel.text = "\(self.jajangCount)"
            self.jambongCount = 0
            self.jambongCountLabel.text = "\(self.jambongCount)"
            self.tangsuCount = 0
            self.tangsuCountLabel.text = "\(self.tangsuCount)"
            self.payMoneyWon = 0
            self.payMoneyWonLabel.text = "\(self.payMoneyWon)원"
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        present(alert, animated: true)
        alert.addAction(ok)
        alert.addAction(cancel)
    }
}
```

