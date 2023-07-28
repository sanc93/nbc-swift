//
//  optionClasses.swift
//  kiosk
//
//  Created by Sanghun K. on 2023/07/25.
//

import Foundation

// 1. 매장식사, 테이크 아웃 여부
class WhereToEat {
    
    struct Option {
        var name : String // 옵션명
    }
    // 버거 메뉴 Array
    var options : [Option] = []
    
    init() { // 배열에 값을 추가하려면 클래스 초기화 메소드에서 추가..
        options.append(Option(name: "매장 식사(For Here)"))
        options.append(Option(name: "테이크 아웃(To-Go)"))
    }
    
    func askToCustomer() -> Void {
        print("")
        print("해당되는 번호를 직접 콘솔 창에 입력해 주세요")
        print("")
        
        for (index, item) in options.enumerated() { // .enumerated()로 하면 index와 item을 쌍으로 묶어서 리턴
            print("[\(index+1)] \(item.name)")
        }
        print("\n-")
        print("[*] 종료")
        
    }
    
}

// 2. 메뉴 카테고리
class MenuCategories {
    
    struct Menu {
        var name : String // 카테고리
        var info : String // 설명
    }
    // 메뉴 카테고리 Array
    var menuCategories : [Menu] = []
    
    init() { // 배열에 값을 추가하려면 클래스 초기화 메소드에서 추가..
        menuCategories.append(Menu(name: "버거(Burger)", info: "\n빅맥에서 맥 스파이스 상하이 버거까지, \n주문 즉시 바로 조리해 더욱 맛있는, \n맥도날드의 다양한 버거를 소개합니다."))
        menuCategories.append(Menu(name: "맥런치(McLunch) *10:30~14:00", info: "\n오전 10시 30분 부터 오후 2시까지 \n점심만의 특별한 할인으로 맥런치 세트를 즐겨보세요!"))
        menuCategories.append(Menu(name: "맥모닝(McMorning) *04:00~10:30" , info: "\n새벽 4시부터 오전 10시 30분까지 \n갓 구워내 신선한 맥모닝으로 \n따뜻한 아침 식사를 챙겨드세요!"))
        menuCategories.append(Menu(name: "해피 스낵(Happy Snack)", info: "\n시즌 별 인기 스낵을 하루종일 \n할인 가격으로 만나보세요!"))
        menuCategories.append(Menu(name: "사이드 & 디저트(Sides & Desserts)", info: "\n가볍게 즐겨도, 버거와 함께 푸짐하게 즐겨도, \n언제나 맛있는 사이드와 디저트 메뉴!"))
        menuCategories.append(Menu(name: "맥카페 & 음료(McCafe & Beverages)", info: "\n언제나 즐겁게, 맥카페와 다양한 음료를 \n부담없이 즐기세요!"))
    }
    
    func askToCustomer() -> Void {
        print("")
        print("어떤 메뉴를 고르시겠습니까?\n해당되는 번호를 직접 콘솔 창에 입력해 주세요")
        print("")
//        for item in options {
//            print(item)
//        }
        for (index, item) in menuCategories.enumerated() { // .enumerated()로 하면 index와 item을 쌍으로 묶어서 리턴
            print("[\(index+1)] \(item.name)")
//          print("[\(index+1)] \(item.name) : \(item.info)")
        }
        print("\n-")
        print("[0] 뒤로가기")
        print("[*] 종료")
    }
}

    // 카트 담기
    func addCart() -> String? {
        print("")
        print("선택하신 메뉴를 카트에 담으시겠습니까?\n해당되는 번호를 직접 콘솔 창에 입력해 주세요")
        print("")
        print("[1] 카트에 담기")
        print("\n-")
        print("[0] 뒤로가기")
        
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
    
