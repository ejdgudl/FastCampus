# LoginPage

```swift
//
//  ViewController.swift
//  login
//
//  Created by 김동현 on 2020/05/15.
//  Copyright © 2020 ejdgudl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
  
  struct UserInfo {
    static let memberList = ["Qwer":"asdf"]
  } // 유저들의 아이디(key)와 비밀번호(value)를 딕셔너리 타입으로  UserDefault에 저장할거다. 일단은 처음에 아이디와 비번을 회원가입 과정없이 로그인 할 수 있게끔 아이디비번 1개씩 먼저 넣어놓았다.
  
  let banner = UIImageView() // 베너 이미지.
  let view1 = UIView() // 빨간거.
  let view2 = UIView() // 빨간거.
  let view3 = UIView() // 빨간거.
  let containerView = UIView() // 이메일 이미지, 이메일 텍스트필드, 패스워드 이미지, 패스워드 텍스트필드, 로그인 버튼, 회원가입 버튼을 담은 뷰.
  let emailImage = UIImageView() // 이메일 이미지.
  let passwordImage = UIImageView() // 패스워드 이미지.
  let emailTextField = UITextField() // 이메일 텍스트필드.
  let passwordTextField = UITextField() // 패스워드 텍스트필드.
  let loginButton = UIButton() // 로그인 버튼.
  let joinButton = UIButton() // 회원가입 버튼.
  let userDefaults = UserDefaults.standard // userDefaults 사용시에 편의를 위해 변수에 .standard 까지 담아놈
  var loginStatus : Bool = true // 로그인에 성공한후 백그라운드에서 앱을 종료후에 다시 앱을 실행시켜도 로그인 기록이 남아있게 구현할껀데 그때 유저디폴트로 사용할 변수이다.
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUserDefaults()
    setupBanner()
    setupView1()
    setupView2()
    setupView3()
    setupContainer()
    setupEmailImage()
    setupPasswordImage()
    setupEmailTextfield()
    setupEmailFieldUnderLine(emailTextField)
    setupPasswordTextfield()
    setupPasswordFieldUnderLine(passwordTextField)
    setupLoginButton()
    setupJoinButton()
    emailTextField.delegate = self // emailTextField의 위임자를 self로 선정 하면서 emailTextField는 맨밑에 textFieldShouldReturn 메소드를 실행시킬 수 있다.
    passwordTextField.delegate = self // passwordTextField의 위임자를 self로 선정 하면서 passwordTextField는 맨밑에 textFieldShouldReturn 메소드를 실행시킬 수 있다.
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil) // NotificationCenter를 사용하여 키보드가 올라올때 뷰가 같이 올라오게끔 keyboardWillShow라는 objc메소드를 따로 작성하여 기입함
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil) // NotificationCenter를 사용하여 키보드가 내려갈때 뷰가 같이 내려가게끔 keyboardWillHide라는 objc메소드를 따로 작성하여 기입함
  }
  
  func setupUserDefaults() {
    userDefaults.set(UserInfo.memberList, forKey: "joinList")
  } // 맨위에 UserInfo안에 memberList(딕셔너리)에 값들을 userDefaults를 사용하여 "joinList"에 저장한다.
  // 밑에 didTapLoginButton objc메소드에서 사용할꺼다. ******유저디폴트저장******
  
  func setupBanner() {
    banner.frame = CGRect(x: 55, y: 70, width: 300, height: 60)
    let image = UIImage(named: "banner")
    banner.image = image
    view.addSubview(banner)
  } // 베너 설정
  
  func setupView1() {
    view1.frame = CGRect(x: 150, y: 150, width: 25, height: 25)
    view1.backgroundColor = .red
    view1.layer.cornerRadius = 5
    view.addSubview(view1)
  } // 빨건거1 설정
  
  func setupView2() {
    view2.frame = CGRect(x: 195, y: 150, width: 25, height: 25)
    view2.backgroundColor = .red
    view2.layer.cornerRadius = 5
    view.addSubview(view2)
  } // 빨건거2 설정
  
  func setupView3() {
    view3.frame = CGRect(x: 240, y: 150, width: 25, height: 25)
    view3.backgroundColor = .red
    view3.layer.cornerRadius = 5
    view.addSubview(view3)
  } // 빨건거3 설정
  
  func setupContainer() {
    containerView.frame = CGRect(x: 32, y: 510, width: 350, height: 110)
    view.addSubview(containerView)
  } // 이메일 이미지, 이메일 텍스트필드, 패스워드 이미지, 패스워드 텍스트필드, 로그인 버튼, 회원가입 버튼을 담은 컨테이너뷰 설정.
  
  func setupEmailImage() {
    emailImage.frame = CGRect(x: 20, y: 20, width: 30, height: 25)
    let image = UIImage(named: "emailImage")
    emailImage.image = image
    containerView.addSubview(emailImage)
  } // 이메일 이미지 설정
  
  func setupPasswordImage() {
    passwordImage.frame = CGRect(x: 20, y: 65, width: 30, height: 30)
    let image = UIImage(named: "passwordImage")
    passwordImage.image = image
    containerView.addSubview(passwordImage)
  } // 패스워드 이미지 설정
  
  func setupEmailTextfield() {
    emailTextField.frame = CGRect(x: 75, y: 20, width: 260, height: 30)
    emailTextField.placeholder = "이메일을 입력하세요"
    containerView.addSubview(emailTextField)
  } // 이메일 텍스트필드 설정
  
  func setupEmailFieldUnderLine(_ textField: UITextField) {
    textField.borderStyle = .none // border style 지우기
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
    bottomLine.backgroundColor = UIColor.lightGray.cgColor
    emailTextField.layer.addSublayer(bottomLine)
  } // emailTextField 언더라인 설정
  
  func setupPasswordTextfield() {
    passwordTextField.frame = CGRect(x: 75, y: 65, width: 260, height: 30)
    passwordTextField.placeholder = "비밀번호를 입력하세요"
    passwordTextField.isSecureTextEntry = true
    containerView.addSubview(passwordTextField)
  } // 패스워드 텍스트필드 설정
  
  func setupPasswordFieldUnderLine(_ textField: UITextField) {
    textField.borderStyle = .none // border style 지우기
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
    bottomLine.backgroundColor = UIColor.lightGray.cgColor
    passwordTextField.layer.addSublayer(bottomLine)
  } // passwordTextField 언더라인 설정
  
  func setupLoginButton() {
    loginButton.frame = CGRect(x: 35, y: 660, width: 350, height: 50)
    loginButton.backgroundColor = .gray
    loginButton.setTitle("Login", for: .normal)
    loginButton.layer.cornerRadius = 10
    loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    view.addSubview(loginButton)
  } // 로그인 버튼 설정
  
  @objc func didTapLoginButton(_ sender: Any) {
    let email = self.emailTextField.text // emailTextField에 입력될 text를 email이라는 상수에 할당.
    let password = self.passwordTextField.text // passwordTextField에 입력될 text를 password라는 상수에 할당.
    let member = userDefaults.dictionary(forKey: "joinList") // userDefaults에 dictionary타입의 "joinList"라는 이름으로 저장되어 있는 값을 상수 member에 할당. ******유저디폴트사용******
    guard let idCount = email?.count, idCount >= 4 else {
      let idCountAlert = UIAlertController(title: "알림", message: "email을 4자 이상 입력해주세요", preferredStyle: .alert)
      let ok = UIAlertAction(title: "확인", style: .default)
      present(idCountAlert, animated: true)
      idCountAlert.addAction(ok)
      self.emailTextField.text = ""
      self.passwordTextField.text = ""
      UIView.animate(withDuration: 0.3) {
        self.emailTextField.backgroundColor = .red
        self.emailTextField.backgroundColor = .white
      } // 애니메이션 코드
      return
    } // 최소 텍스트 카운트 검사
    guard let pwCount = password?.count, pwCount >= 4 else {
      let pwCountAlert = UIAlertController(title: "알림", message: "password를 4자 이상 입력해주세요", preferredStyle: .alert)
      let ok = UIAlertAction(title: "확인", style: .default)
      present(pwCountAlert, animated: true)
      pwCountAlert.addAction(ok)
      self.passwordTextField.text = ""
      UIView.animate(withDuration: 0.3) {
        self.passwordTextField.backgroundColor = .red
        self.passwordTextField.backgroundColor = .white
      } // 애니메이션 코드
      return
    } // 최소 텍스트 카운트 검사
    guard let pw = member?[email!] as? String else {
      let differentEmailAlert = UIAlertController(title: "알림", message: "입력하신 아이디는 존재하지 않습니다", preferredStyle: .alert)
      let ok = UIAlertAction(title: "알림", style: .default)
      present(differentEmailAlert, animated: true)
      differentEmailAlert.addAction(ok)
      self.emailTextField.text = ""
      self.passwordTextField.text = ""
      UIView.animate(withDuration: 0.3) {
        self.emailTextField.backgroundColor = .red
        self.emailTextField.backgroundColor = .white
        self.passwordTextField.backgroundColor = .red
        self.passwordTextField.backgroundColor = .white
      } // 애니메이션 코드
      return
    } // 아이디 확인
    // pw 라는 상수를 선언하고 위에 member(딕셔너리)옆에 email(키값)을 넣어서 상수 pw에는 email(key값)의 반환값(value값)을 할당 받게 된다.
    //EX
    //let dict = ["Qwer" : "asdf"]
    //"Qwer"을 키값으로 넣으면 "asdf"를 반환.
    //let pw = dict["Qwer"]
    //pw = "asdf"
    guard pw == password else {
      let differentPasswordAlert = UIAlertController(title: "알림", message: "입력하신 비밀번호는 존재하지 않습니다", preferredStyle: .alert)
      let ok = UIAlertAction(title: "알림", style: .default)
      present(differentPasswordAlert, animated: true)
      differentPasswordAlert.addAction(ok)
      self.passwordTextField.text = ""
      UIView.animate(withDuration: 0.3) {
        self.passwordTextField.backgroundColor = .red
        self.passwordTextField.backgroundColor = .white
      } // 애니메이션 코드
      return
    }
    // 위에 가드문 들이 다 통과 한다면
    userDefaults.set(email, forKey: "loginID") // userDefaults를 사용하여 email(즉 self.emailTextField.text)을 저장하는데 여기서 "loginID"라는 이름의 키 안에다가 저장할거다
    // 이 저장값은 SecondViewController에 있는 레이블에 띄우는데 활용할거다 ******유저디폴트저장******
    userDefaults.set(loginStatus, forKey: "loginStatus") //******유저디폴트저장******
    let secondVC = SecondViewController()
    secondVC.modalPresentationStyle = .fullScreen
    present(secondVC, animated: true)
    // secondVC.IdLabel.text = self.emailTextField.text -> userDefaults가 아닌 단순히 secondVC에 접근하여 데이터 전달 했을때 이렇게 사용
  } // setupLoginButton에 addTarget에 #selector에 들어갈 objc메소드
  
  func setupJoinButton() {
    joinButton.frame = CGRect(x: 35, y: 730, width: 350, height: 50)
    joinButton.setTitle("Join", for: .normal)
    joinButton.backgroundColor = .gray
    joinButton.layer.cornerRadius = 10
    joinButton.addTarget(self, action: #selector(didTapJoinButton), for: .touchUpInside)
    view.addSubview(joinButton)
  } // 회원가입 버튼 설정
  
  @objc func didTapJoinButton(_ sender: Any) {
    let JoinVC = JoinViewController()
    JoinVC.modalPresentationStyle = .fullScreen
    present(JoinVC, animated: true)
  } // setupJoinButton에 addTarget에 #selector에 들어갈 objc메소드
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
  }
  // 맨위에 보면 UITextFieldDelegate를 채택했고 그 델리게이트 안에 있는 textFieldShouldReturn이라는걸 사용했는데 이메소드안에 resignFirstResponder를 작성하여 엔터(리턴)키를 눌렀을때 키보드가 내려가게 하는 기능을 구현하게 한다
  
  @objc func keyboardWillShow(_ sender: Any) {
    self.containerView.frame.origin.y = 290
    self.loginButton.frame.origin.y = 440
    self.joinButton.frame.origin.y = 510
  }
  // viewDidLoad안에 NotificationCenter를 사용하여 키보드가 올라올때 뷰가 같이 올라오게끔 작성을 하는데 그 구문안에 #selector에 기입할 objc메소드 작성
  
  @objc func keyboardWillHide(_ sender: Any) {
    self.containerView.frame.origin.y = 510
    self.loginButton.frame.origin.y = 660
    self.joinButton.frame.origin.y = 730
  }
  // viewDidLoad안에 NotificationCenter을 사용하여 키보드가 내려갈때 뷰가 같이 올라오게끔 작성을 하는데 그 구문안에 #selector에 기입할 objc메소드 작성
}
```



```swift
//
//  SecondViewController.swift
//  login
//
//  Created by 김동현 on 2020/05/15.
//  Copyright © 2020 ejdgudl. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  
  var IdLabel = UILabel() // 로그인에 성공했을때 레이블에 아이디가 나오는 레이블
  let dismissButton = UIButton() // 로그아웃 버튼
  let userDefaults = UserDefaults.standard // userDefaults 사용시에 편의를 위해 변수에 .standard 까지 담아놈
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    setupIdLabel()
    setupDissmissButton()
    
    //******유저디폴트사용******
    if let text = userDefaults.string(forKey: "loginID") {
      IdLabel.text = text
    } // ViewController에 didTapLoginButton안에 "loginID"라는 키값으로 userDefault를 사용하여 저장한적이 있다. 그 저장한 값을 이용해서 IdLabel이라는 곳에 저장한 userDefaults값을 string타입으로 불러온것이다(viewDidLoad에 넣어 두었으니 뷰가 로드될때마다 레이블에 표시됨.)
    // 즉 ViewController에서 로그인에 성공될때마다 SecondViewController로 present하게되는데 그때 입력받아 저장되는 값을 이곳에 띄운다
  }
  
  func setupIdLabel() {
    IdLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    IdLabel.center = view.center
    IdLabel.text = "ID"
    IdLabel.textAlignment = .center
    view.addSubview(IdLabel)
  } // 로그인 성공후 아이디가 나타날 레이블 설정
  
  func setupDissmissButton() {
    dismissButton.frame = CGRect(x: 35, y: 680, width: 350, height: 50)
    dismissButton.setTitle("로그아웃", for: .normal)
    dismissButton.backgroundColor = .gray
    dismissButton.layer.cornerRadius = 5
    dismissButton.addTarget(self, action: #selector(didTapDismissButton), for: .touchUpInside)
    view.addSubview(dismissButton)
  } // 로그아웃 버튼 설정
  
  @objc func didTapDismissButton(_ sender: Any) {
    //******유저디폴트저장******
    userDefaults.set(false, forKey: "loginStatus") // 로그아웃버튼을 눌렀을때 userDefaults를 통해서 저장 할건데
    // 여기서 "loginStatus"라는 이름으로 저장 되있던 키값 안에 nil값을 저장할거다
    // 왜냐하면 로그아웃버튼을 누르면 첫번째 뷰컨트롤러로 돌아갈꺼고 그말은 즉 저장해 놓았던 로그인 상태를 해제해야 한다는건데
    // 그래서 nil값을 넣었다
    if let _ = self.presentingViewController as? ViewController { // 만약 _ 에 지금 보여지는 뷰컨트롤러(SecondViewController)를 받처주는, 즉 나를 뛰어주는 뷰컨트롤러(부모 뷰컨트롤러)가 있고 그 뷰컨트롤러(부모 뷰컨트롤러)를 ViewController로 타입캐스팅(다운캐스팅)이 된다면
      dismiss(animated: true, completion: nil)// dimiss를 할꺼다
    } else {
      // 위에 if문의 조건이 맞지 않는다면 else구문 실행
      if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        let sceneDelegate = windowScene.delegate as? SceneDelegate
        sceneDelegate?.window?.rootViewController = ViewController()
        sceneDelegate?.window?.makeKeyAndVisible()
      }
        
    }
  } // setupDissmissButton에 addTarget에 #selector안에 들어갈 objc메소드
  
}

// 강사님 코드
/*
 if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
 let sceneDelegate = windowScene.delegate as? SceneDelegate
 sceneDelegate?.window?.rootViewController = SignInViewController()
 }
 */
```



```swift
//
//  JoinViewController.swift
//  login
//
//  Created by 김동현 on 2020/05/17.
//  Copyright © 2020 ejdgudl. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController, UITextFieldDelegate {
  
  
  let wellcomeLabel = UILabel() // 환영합니다 레이블
  let containerView = UIView() // 이메일 텍스트필드, 패스워드 텍스트필드를 담은 컨테이너뷰.
  let emailSignUpTF = UITextField() // 이메일 텍스트필드
  let passwordSignUpTF = UITextField() // 비밀번호 텍스트필드
  let joinButton = UIButton() // 회원가입 버튼
  let userDefault = UserDefaults.standard // userDefaults 사용시에 편의를 위해 변수에 .standard 까지 담아놈
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupWellcomeLabel()
    setupJoinButton()
    setupContainnerView()
    setupEmailSignUpTF()
    setupPasswordSignUpTF()
    emailSignUpTF.delegate = self // emailSignUpTF의 위임자를 self로 선정 하면서 맨밑에 textFieldShouldReturn 메소드를 실행시킬 수 있다.
    passwordSignUpTF.delegate = self // passwordSignUpTF의 위임자를 self로 선정 하면서 맨밑에 textFieldShouldReturn 메소드를 실행시킬 수 있다.
    view.backgroundColor = .systemBackground
  }
  
  func setupWellcomeLabel() {
    wellcomeLabel.frame = CGRect(x: 170, y: 200, width: 200, height: 200)
    wellcomeLabel.text = "환영합니다"
    view.addSubview(wellcomeLabel)
  } // 환영합니다 레이블 설정
  
  func setupContainnerView() {
    containerView.frame = CGRect(x: 35, y: 400, width: 350, height: 200)
    view.addSubview(containerView)
  } // 이메일 텍스트필드, 패스워드 텍스트필드를 담은 컨테이너뷰.
  
  func setupEmailSignUpTF() {
    emailSignUpTF.frame = CGRect(x: 20, y: 40, width: 300, height: 50)
    emailSignUpTF.placeholder = "사용하실 email ID를 적어주세요"
    emailSignUpTF.textAlignment = .center
    containerView.addSubview(emailSignUpTF)
  } // emailSignUpTF 설정.
  
  func setupPasswordSignUpTF() {
    passwordSignUpTF.frame = CGRect(x: 20, y: 90, width: 300, height: 50)
    passwordSignUpTF.placeholder = "사용하실 비밀 번호를 적어주세요"
    passwordSignUpTF.textAlignment = .center
    containerView.addSubview(passwordSignUpTF)
  } // passwordSignUpTF 설정,
  
  
  func setupJoinButton() {
    joinButton.frame = CGRect(x: 35, y: 680, width: 350, height: 50)
    joinButton.setTitle("회원가입", for: .normal)
    joinButton.backgroundColor = .gray
    joinButton.layer.cornerRadius = 10
    joinButton.addTarget(self, action: #selector(didTapJoinButton), for: .touchUpInside)
    view.addSubview(joinButton)
  } // 회원가입 버튼 설정
  
  @objc func didTapJoinButton(_ sender: Any) {
    var member = userDefault.dictionary(forKey: "joinList") //******유저디폴트사용******
    if member!.keys.contains(emailSignUpTF.text!) {
      let sameEmailAlert = UIAlertController(title: "알림", message: "중복된 email 입니다", preferredStyle: .alert)
      let ok = UIAlertAction(title: "확인", style: .default)
      present(sameEmailAlert, animated: true)
      sameEmailAlert.addAction(ok)
      emailSignUpTF.text = ""
      passwordSignUpTF.text = ""
      
    }
    // member라는 변수에 "joinList"의 이름으로 저장된걸 딕셔너리 형태로 가저옴
      // 그 member 변수에 keys에 emailSignUpTF.text가 포함되어있는지 보고
      // 포함되어있으면 "중복된 email 입니다" 알라트를 띄움
    else {
      member!.updateValue(passwordSignUpTF.text!, forKey: emailSignUpTF.text!)
      userDefault.set(member, forKey: "joinList") //******유저디폴트저장******
      //userDefault.set([emailSignUpTF.text: passwordSignUpTF.text], forKey: "joinList")
    }
    // 포함되지 않았으면 member에 updateValue를 해줘서 키값(아이디), 밸류값(비번)을 업데이트(추가)해준다.
    dismiss(animated: true)
  } // setupJoinButton에 addTarget에 #selector안에 들어갈 objc메소드
  
  
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
  } // UITextFieldDelegate를 채택하고 그 델리게이트 안에 있는 textFieldShouldReturn이라는 프로토콜을 사용했는데 이메소드안에 resignFirstResponder를 작성하여 엔터(리턴)키를 눌렀을때 키보드가 내려가게 하는 기능을 구현하게 한다.
}

/*
 @objc func didTapJoinButton(_ sender: Any) {
 if var member = userDefault.dictionary(forKey: "joinList") {
 member.updateValue(passwordSignUpTF.text!, forKey: emailSignUpTF.text!)
 userDefault.set(member, forKey: "joinList")
 } else {
 userDefault.set([emailSignUpTF.text: passwordSignUpTF.text], forKey: "joinList")
 }
 dismiss(animated: true)
 } // setupJoinButton에 addTarget에 #selector안에 들어갈 objc메소드
 */
```



```swift
//
//  SceneDelegate.swift
//  login
//
//  Created by 김동현 on 2020/05/15.
//  Copyright © 2020 ejdgudl. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  let userDefaults = UserDefaults.standard


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    
  
    if userDefaults.bool(forKey: "loginStatus") == false { // ViewController의 objc메소드 didTapLoginButton안에 "loginStatus"이라는 키값으로 저장되어있는 유저디폴트를 여기서 활용한다. userDefaults에서 불타입으로 가저와서 저장되있던 값이 false 이면, 즉 로그아웃이 된 상태이면 (dismiss버튼을 눌러서 저장되있던 userDefaults값에 nil을 넣었던 SecondViewController의 didTapDismissButton 메소드를 다시 보고 올것 ).
      // 즉 로그인이 안된상태.
      window?.rootViewController = ViewController() // rootViewController는 ViewController가 될것이고
    } else {
      // 로그인이 된상태.
       //userDefaults에서 불타입으로 가저와서 저장되있던 값이 true이면
      window?.rootViewController = SecondViewController()
      // rootViewController는 SecondViewController가 될것이다.
      // 로그인이 유지가 되어 있다는 거니깐
    }
    
    window?.frame = UIScreen.main.bounds
    window?.backgroundColor = .systemBackground
    window?.makeKeyAndVisible()
  }

  
  
  
//--------------------------
  /*
  let vc = ViewController()
  
  window = UIWindow(windowScene: windowScene)
  
  window?.rootViewController = vc
  window?.backgroundColor = .systemBackground
  window?.makeKeyAndVisible()
 */
//--------------------------
  
  
  
  
  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}
```

