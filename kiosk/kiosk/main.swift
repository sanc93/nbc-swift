import Foundation

/**
- Lv1
    - 입력받은 숫자에 따라 다른 로직을 실행하는 코드를 작성
    - if나 switch, guard 문을 활용
    - 반복문을 이용해서 특정 번호가 입력되면 프로그램을 종료
    - readline 함수로 값을 입력
- Lv2
    - 필요한 클래스들을 설계 (버거, 아이스크림, 음료, 맥주, 주문, 공통 등)
    - 클래스들의 프로퍼티와 메소드를 정의
    - 메소드를 이용해서 Lv1의 코드를 개선
- Lv3
    - Lv2에서 설계한 클래스들을 상속 관계를 가지도록 변경 (Burger도 부모 클래스를 가질 수 있을지 고민!)
    - 하나의 리스트객체로 모든 메뉴들을 관리하도록 수정 (List) 
- Lv4*
    - 숫자를 입력해야하는데 문자를 입력했을때 다시 입력할 수 있도록 예외를 처리
    - 현재 잔액과 가격을 비교해서 구매 가능한 상태를 정의 (클래스 추가가능)
- Lv5*
    - 특정 작업이 종료된 후, 3초뒤에 다른 작업을 수행할 수 있도록 코드를 작성
    - 결제시 현재 시간을 비교하여 특정 시간대에는 결제할 수 없다는 알림창을 띄우기
    - 프로그램을 종료할때까지 5초마다 현재 주문 대기수를 실시간으로 출력
*/


let dateFormatter = DateFormatter()

func currentTime() -> String {
    dateFormatter.locale = Locale(identifier:"ko_KR")
    dateFormatter.dateFormat = "HH:mm"
    let timeStr = dateFormatter.string(from: Date())
    return timeStr
}


enum MenuOption: String {
    case burger = "1"
    case mcLunch = "2"
    case mcMorning = "3"
    case happySnack = "4"
    case sidesAndDesserts = "5"
    case mcCafeAndBeverages = "6"
    
    case back = "0"
    case exit = "*"
    
    init?(inputValue: String) {
           // rawValue(원시값)와 입력값이 일치하는 enum case를 찾아서 반환
           if let menuOption = MenuOption(rawValue: inputValue) {
               self = menuOption
           } else {
               // 유효하지 않은 입력일 경우 nil 반환
               return nil
           }
       }
}

func greeting() {
    print("안녕하세요! 맥도날드 키오스크 입니다")
    print("오늘은 어떻게 드시겠습니까?")
    
}

func divider() {
    print("")
    print("=========== ⌚️",currentTime()," ===========")
    print("")
}

func getValue() -> String? {
    while true {
        // 콘솔창에 "입력 : "표시
        print("입력 : ", terminator: "")
        // 사용자가 값 입력할떄까지 계속 받아냄. (빈값, "" 거부)
        guard let inputValue: String = readLine(), !inputValue.isEmpty, !(inputValue == "") else {
            print("값을 입력하지 않았거나 숫자가 입력되지 않았습니다.")
            continue
        }
            return inputValue
    }
    
}


// 메인
func kioskMain() {
    
    divider()
    greeting()
    WhereToEat().askToCustomer()
    divider()
    getValue()
    categoryMain()
    
}

func categoryMain() {
    
    MenuCategories().askToCustomer() // 123123
    divider()
    if let inputValue = getValue(),  let selectedOption = MenuOption(inputValue: inputValue) {
        // MenuOption enum으로 변환된 값을 사용하여 switch 문을 처리
        switch selectedOption {
        case .burger: // "1":
            Burger().askToCustomer()
            divider()
            let a = addCart() // TODO : cart에 담을 수 있도록 하기
        case .mcLunch :
            // 맥런치 이용시간 (10:30~14:00)이 아니면 카테고리 메인으로 돌아가도록
            if let mcLunchStartTime = dateFormatter.date(from: "10:30"),
            let mcLunchEndTime = dateFormatter.date(from: "14:00"),
               let currentTime = dateFormatter.date(from: currentTime()) {
                if currentTime >= mcLunchStartTime && currentTime <= mcLunchEndTime {
                    McLunch().askToCustomer()
                } else {
                    print("⚠️ 맥런치 이용 가능 시간이 아닙니다. 다시 선택해 주세요.")
                    categoryMain()
                }
            }
        case .mcMorning :
            // 맥모닝 이용시간 (04:00~10:30)이 아니면 카테고리 메인으로 돌아가도록
            if let mcLunchStartTime = dateFormatter.date(from: "04:00"),
            let mcLunchEndTime = dateFormatter.date(from: "10:30"),
               let currentTime = dateFormatter.date(from: currentTime()) {
                if currentTime >= mcLunchStartTime && currentTime <= mcLunchEndTime {
                    McMorning().askToCustomer()
                } else {
                    print("⚠️ 맥모닝 이용 가능 시간이 아닙니다. 다시 선택해 주세요.")
                    categoryMain()
                }
            }
            
        case .happySnack :
            HappySnack().askToCustomer()
        case .sidesAndDesserts :
            SidesAndDesserts().askToCustomer()
        case .mcCafeAndBeverages :
            McCafeAndBeverages().askToCustomer()
        case .back :
            print("돌아가기를 선택하셨습니다")
            kioskMain()
        case .exit :
            print("종료하기를 선택하셨습니다")
            print("키오스크를 종료합니다")
            exit(0)
        default:
            break
        }
    }
}



// Start
kioskMain()

