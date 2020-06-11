# The App Life Cycle
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.50.33.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.50.48.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.50.56.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.51.05.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.51.20.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.51.29.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.51.40.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.51.48.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.51.54.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.52.00.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.52.08.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.52.15.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.52.22.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.52.29.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.52.37.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.52.45.png?raw=true)
![enter image description here](https://github.com/ejdgudl/TIL/blob/master/Images/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202020-04-23%20%EC%98%A4%ED%9B%84%2011.52.50.png?raw=true)

```swift
//

// AppDelegate.swift

// test

//

// Created by 김동현 on 2020/06/11.

// Copyright © 2020 김동현. All rights reserved.

//

// 만약에 씬델레게이트 안 쓰고 통일해서 쓰고싶다 하면

// 1. 씬델리게이트 삭제

// 2. 앱델리게이트에서 밑에 // MARK: UISceneSession Lifecycle 부분 삭제

// 3. AppDelegate.swift 파일에 var window: UIWindow? 프로퍼티 작성

// 4. info.plist에서 Appllication Scene Manifest부분에 -버튼 눌러 삭제

// (앱이 돌아갈때 필요한 정보들을 저장을 해두는 인포, 정보를 담은 리스트)

// 5. 이렇게 하면 앱델리게이트가 호출됨

// 6. 현업에 가면 씬델리게이트가 있는걸 잘 못볼거다. 예전거만 있기때문에

// 내년 내후년에는 생겨있을수 있다.





**import** UIKit





**@UIApplicationMain** // 어트리뷰트 , UIApplicationMain이 관리한다

**class** AppDelegate: UIResponder, UIApplicationDelegate {



// didFinishLaunchingWithOptions

  **func** application(**_** application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : **Any**]? = **nil**) -> Bool {

​    print("willFinishLaunchingWithOptions")

​    **return** **true**

  }

// 일반적으로 여기에 초기 설정 같은걸 많이 하게된다, // 내가 어떤 작업을 하기위한 초기 단계

  **func** application(**_** application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: **Any**]?) -> Bool {

​    print("didFinishLaunchingWithOptions")

​    **return** **true**

  }

// active 상태가 되었을때

  **func** applicationDidBecomeActive(**_** application: UIApplication) {

​    print("applicationDidBecomeActive")

  }

// inactive상태가 되기 직전에

  **func** applicationWillResignActive(**_** application: UIApplication) {

​    print("applicationWillResignActive")

  }

// backgrond로 갈때

  **func** applicationDidEnterBackground(**_** application: UIApplication) {

​    print("applicationDidEnterBackground")

  }

//Foreground로 들어갈때

  **func** applicationWillEnterForeground(**_** application: UIApplication) {

​    print("applicationWillEnterForeground")

  }

// 앱이 종료될때

  **func** applicationWillTerminate(**_** application: UIApplication) {

​    print("applicationWillTerminate")

  }

   

   

   

  // MARK: **UISceneSession Lifecycle**

  **@available**(**iOS** 13.0, *) // 특정한 함수들만 ios13 이상에서만 사용하겠다

  **func** application(**_** application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

​    // Called when a new scene session is being created.

​    // Use this method to select a configuration to create the new scene with.

​    **return** UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)

  }



  **func** application(**_** application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

​    // Called when the user discards a scene session.

​    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.

​    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.

  }





}
```
