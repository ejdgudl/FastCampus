# **AutoLayout**

```
뷰에 주어진 제약조건에 따라 뷰의 크기와 위치를 동적으로 계산해 배치하는 것 외부 또는 내부의 변화에 동적으로 반응하여 유저 인터페이스 구성
```



## **External / Internal Changes**

**외적 변화 요소** **(External Changes)**

- 서로 다른 기기 및 스크린 크기
-  기기 회전
-  iPad / iPhone+ 등에서 Split View 로 진입하거나 빠져나올 때 ...

**내적 변화 요소** **(Internal Changes)**

- 앱에서 보여지는 컨텐츠의 변화
-  국제화 지원 (텍스트, 날짜와 숫자, RTL 등) Dynamic Type 지원 (글꼴 크기)
- ...



## **Laying out a user interface**

```
유저 인터페이스 구성을 위한 3가지 주요 접근 방식 
- Frame 기반의 프로그래밍 방식
- Autoresizing masks 
- Auto Layout
```



## **Frame-Based Layout**

```
프레임 기반의 프로그래밍 방식
- 원점의 위치와 크기를 통해 그릴 영역 계산 가장 유연하며 빠른 성능
- 모든 뷰에 대해 개별적인 설정과 관리
- 동적인 변화에 대한 설계 및 디버그, 유지 관리 에 많은 노력 필요
```



**오토레이아웃 방식**

- 제약 조건을 이용해 유저 인터페이스 정의 
- 뷰간의 관계 설정을 통한 크기와 위치 계산 
- 내/외부 변경 사항에 동적으로 반응 
- Frame 기반에 비해 느린 성능



## **Auto Layout tools**

**• Update Frames** : 제약조건과 맞지 않는 뷰 위치 갱신 

**• Align** : 정렬에 관한 제약사항 설정
**• Pin** : 간격, 크기, 비율 등에 대한 제약 조건 설정

**Resolve Autolayout Issues** : 오토레이아웃 관련 문제 해결 

**Embed In** : 컨테이너 뷰 / 뷰컨트롤러 추가


```swift
Frame으로 위치 잡을 때 SafeArea

view.safeAreaInsets.top // safeArea 의 노치 부분 기본값은 44 ios10 이상

UIApplication.shared.statusBarFrame.size.heiht // ios10 이상 에서는 사용 불가

```



