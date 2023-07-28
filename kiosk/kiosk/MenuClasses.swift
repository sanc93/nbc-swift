//
//  classes.swift
//  kiosk
//
//  Created by Sanghun K. on 2023/07/25.
//

import Foundation

class Menu {
    struct MenuItem {
        var category : String // 카테고리명
        var name : String // 메뉴명
        var price : Int // 가격
        var info : String // 상품소개
    }
    // 메뉴 Array
    var menuItems : [MenuItem] = []
    
//    init() {
//
//        }
    func askToCustomer() -> Void {
        print("")
        print("메뉴 목록입니다.\n해당되는 번호를 직접 콘솔 창에 입력해 주세요")
        print("")
        for (index, item) in menuItems.enumerated() { // .enumerated()로 하면 index와 item을 쌍으로 묶어서 리턴
            print("[\(index+1)] \(item.name) (\(item.price)원)")
        }
        print("\n-")
        print("[0] 뒤로가기")
        print("[*] 종료")
    }
}

// 버거(Burger)
class Burger: Menu {
    
   override init() { // 배열에 값을 추가하려면 클래스 초기화 메소드에서 추가..
       super.init()
       menuItems.append(MenuItem(category: "Burger", name: "진도 대파 크림 크로켓 버거", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "Burger", name: "빅맥", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "Burger", name: "더블 쿼터파운더 치즈", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "Burger", name: "쿼터파운더 치즈", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "Burger", name: "맥크리스피 디럭스 버거", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "Burger", name: "맥크리스피 클래식 버거", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "Burger", name: "맥스파이시 상하이 버거", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "Burger", name: "맥치킨 모짜렐라", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "Burger", name: "맥치킨", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "Burger", name: "더블 불고기 버거", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "Burger", name: "애그 불고기 버거", price: 5000, info: ""))
    }
    
}

// 맥런치(McLunch)
class McLunch: Menu {
    
   override init() {
       super.init()
       menuItems.append(MenuItem(category: "McLunch", name: "진도 대파 크림 크로켓 버거 세트", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McLunch", name: "빅맥 세트", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McLunch", name: "맥크리스피 디럭스 버거 세트", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McLunch", name: "맥스파이시 상하이 버거 세트", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McLunch", name: "1955 버거 세트", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McLunch", name: "더블 불고기 버거 세트", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McLunch", name: "베이컨 토마토 디럭스 세트", price: 5000, info: ""))
    }
    
}

// 맥모닝(McMorning)
class McMorning: Menu {
    
   override init() {
       super.init()
       menuItems.append(MenuItem(category: "McMorning", name: "베이컨 에그 맥그리들", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McMorning", name: "소세지 에그 맥그리들", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McMorning", name: "베이컨 토마토 에그 맥머핀", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McMorning", name: "치킨 치즈 머핀", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McMorning", name: "에그 맥머핀", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McMorning", name: "베이컨 에그 맥머핀", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McMorning", name: "소시지 에그 맥머핀", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McMorning", name: "상하이 치킨 스낵랩", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McMorning", name: "디럭스 브렉퍼스트", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McMorning", name: "핫케익 3조각", price: 5000, info: ""))
    }
    
}

// 해피 스낵(Happy Snack)
class HappySnack: Menu {
    
   override init() {
       super.init()
       menuItems.append(MenuItem(category: "HappySnack", name: "케이준 비프 스낵랩", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "HappySnack", name: "아이스 아메리카노", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "HappySnack", name: "아이스 바닐라 라떼", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "HappySnack", name: "코카-콜라 제로", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "HappySnack", name: "치즈버거", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "HappySnack", name: "골든 모짜렐라 치즈스틱 2조각", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "HappySnack", name: "바닐라 선데이 아이스크림", price: 5000, info: ""))
    }
    
}

// 사이드 & 디저트(Sides & Desserts)
class SidesAndDesserts: Menu {
    
   override init() {
       super.init()
       menuItems.append(MenuItem(category: "SidesAndDesserts", name: "허니버터 인절미 맥쉐이커 후라이", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "SidesAndDesserts", name: "케이준 비프 스낵랩", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "SidesAndDesserts", name: "맥윙", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "SidesAndDesserts", name: "맥윙 콤보", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "SidesAndDesserts", name: "코울슬로", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "SidesAndDesserts", name: "상하이 치킨 스낵랩", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "SidesAndDesserts", name: "골든 모짜렐라 치즈스틱", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "SidesAndDesserts", name: "후렌치 후라이", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "SidesAndDesserts", name: "맥너겟", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "SidesAndDesserts", name: "맥스파이시 치킨 텐더", price: 5000, info: ""))
    }
    
}

// 맥카페 & 음료(McCafe & Beverages)
class McCafeAndBeverages: Menu {
    
   override init() {
       super.init()
       menuItems.append(MenuItem(category: "McCafeAndBeverages", name: "디카페인 아이스크림 라떼", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McCafeAndBeverages", name: "아이스크림 라떼", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McCafeAndBeverages", name: "자두 천도복숭아 칠러", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McCafeAndBeverages", name: "제주 한라봉 칠러", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McCafeAndBeverages", name: "바닐라 라떼", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McCafeAndBeverages", name: "아이스 바닐라 라떼", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McCafeAndBeverages", name: "카페라떼", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McCafeAndBeverages", name: "디카페인 카페라떼", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McCafeAndBeverages", name: "아이스 카페라떼", price: 5000, info: ""))
       menuItems.append(MenuItem(category: "McCafeAndBeverages", name: "디카페인 아이스 카페라떼", price: 5000, info: ""))
    }
    
}
