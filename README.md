# 1단계 게임판 만들기

2021.02.15(월)

### 1. 앱 기본 설정을 지정해서 StatusBar 스타일을 LightContent로 설정

<img width="667" alt="스크린샷 2021-02-15 오후 3 15 07" src="https://user-images.githubusercontent.com/73586326/107911929-dc83ae80-6fa0-11eb-9750-89475901cb2f.png">

Status Bars
statusBar는 화면의 상단 가장자리에 표시되며 시간, 이동통신사, 네트워크 상태 및 배터리 수준과 같은 디바이스의 현재 상태에 대한 유용한 정보를 표시합니다. statusBar에 표시된 실제 정보는 디바이스 및 시스템 구성에 따라 다릅니다.

[출처 및 참고](https://zeddios.tistory.com/569)

### 2. ViewController 클래스에서 self.view 배경을 다음 이미지 패턴으로 지정 (이미지 파일은 Assets에 추가)

<img width="1637" alt="스크린샷 2021-02-15 오후 3 15 49" src="https://user-images.githubusercontent.com/73586326/107911955-ead1ca80-6fa0-11eb-9d98-e65aa18848e6.png">

### 3. 다음 카드 뒷면 이미지를 다운로드해서 프로젝트 Assets.xcassets에 추가

<img width="1519" alt="스크린샷 2021-02-15 오후 3 18 30" src="https://user-images.githubusercontent.com/73586326/107912039-15bc1e80-6fa1-11eb-91e9-62a27a3153c0.png">


### 4. ViewController 클래스에서 코드로 아래 출력 화면처럼 화면을 균등하게 7등분해서 7개 UIImageView를 추가하고 카드 뒷면을 보임

### 5. 카드 가로와 세로의 비율은 1:1.27로 지정

<img width="1792" alt="스크린샷 2021-02-15 오후 9 14 18" src="https://user-images.githubusercontent.com/73586326/107955890-b29eac00-6fe1-11eb-8689-3d21467f36d5.png">

<img width="1764" alt="스크린샷 2021-02-15 오후 10 48 24" src="https://user-images.githubusercontent.com/73586326/107955948-cb0ec680-6fe1-11eb-9aa3-0226438b4f03.png">

# 2단계 카드 클래스

2021.02.16(화)

### 1. 객체지향 프로그래밍 방식에 충실하게 카드 클래스(class)를 설계
- 속성으로 모양 4개 중에 하나, 숫자 1-13개 중에 하나를 가질 수 있다.
- 모양이나 숫자도 적당한 데이터 구조로 표현한다.
- 어떤 이유로 데이터 구조를 선택했는지 주석(comment)으로 구체적인 설명을 남긴다.
- 카드 정보를 출력하기 위한 문자열을 반환하는 함수를 구현한다.
- 문자열에서 1은 A로, 11은 J로, 12는 Q로, 13은 K로 출력한다.

### 2. ViewController에서 특정한 카드 객체 인스턴스를 만들어서 콘솔에 출력

<img width="1792" alt="스크린샷 2021-02-16 오후 5 21 31" src="https://user-images.githubusercontent.com/73586326/108036423-8df71280-707b-11eb-8fc3-df22b6d8674f.png">

# 3단계 카드덱 구현과 테스트

2021.02.17(수)

### 1. 모든 종류의 카드 객체 인스턴스를 포함하는 카드덱 구조체를 구현

### 2. 객체지향 설계 방식에 맞도록 내부 속성을 모두 감추고 다음 인터페이스만 보이도록 구현
- count 갖고 있는 카드 개수를 반환한다.
- shuffle 기능은 전체 카드를 랜덤하게 섞는다.
- removeOne 기능은 카드 인스턴스 중에 하나를 반환하고 목록에서 삭제한다.
- reset 처음처럼 모든 카드를 다시 채워넣는다.

### 3. 메소드 매개변수와 리턴값은 어떤 타입이 좋을지, 속성으로 무엇이 필요한지, 불변 Immutable 인지 가변 mutable 인지 판단

### 4. 상위 모듈에서 카드덱 기능을 확인할 수 있도록 테스트 코드를 추가(동작을 확인할 수 있는 코드를 작성)

<img width="864" alt="스크린샷 2021-02-17 오전 10 42 44" src="https://user-images.githubusercontent.com/73586326/108144744-97c95600-710d-11eb-96da-513d5c3108dd.png">

# 4단계 포커 딜러와 게임 테스트

2021.02.17(수)

### 1. 카드덱을 활용해서 포커 게임 딜러 동작을 하도록 프로그램을 설계하고, 각 역할을 담당하는 클래스 구현

### 2. 카드 게임 규칙과 참여자 수에 따라서 각기 다른 방식으로 카드를 뽑아 출력

### 3. 다음 동작 예시를 참고해서, 각 클래스 동작을 확인하기 위한 PokerGame 객체를 작성

### 프로그래밍 요구사항
- 포커 딜러 선택을 위한 새로운 입력 뷰가 있다고 가정한다.
- 게임은 7카드스터드 방식과 5카드스터드를 지원한다.
- 참여자는 딜러를 제외하고 1명에서 4명까지 참여할 수 있다.
- 카드게임 종류와 참여자수에 따라 각기 다른 동작을 해야한다.
- 카드가 남은 경우는 계속해서 게임을 진행하고, 카드가 부족할 경우 종료한다고 가정한다.

<img width="411" alt="스크린샷 2021-02-17 오후 11 19 11" src="https://user-images.githubusercontent.com/73586326/108217850-6a18f700-7177-11eb-9ba8-ffcb779b77de.png">

# 5단계 포커게임 결과 화면

2021.02.24(수)

![Simulator Screen Shot - iPhone 12 Pro - 2021-02-24 at 15 07 15](https://user-images.githubusercontent.com/73586326/108955849-2d3a8c00-76b2-11eb-953e-a9ea69ed8a3d.png)

![Simulator Screen Shot - iPhone 12 Pro - 2021-02-24 at 15 07 20](https://user-images.githubusercontent.com/73586326/108955946-50653b80-76b2-11eb-995f-63b0b6be51a1.png)

