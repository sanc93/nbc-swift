import UIKit
/*
- Lv1 : 더하기, 빼기, 나누기, 곱하기 연산을 수행할 수 있는 Calculator 클래스를 만들고, 클래스를 이용하여 연산을 진행하고 출력하기
- Lv2 : Lv1에서 만든 Calculator 클래스에 나머지 연산을 가능하도록 코드를 추가하고, 연산 진행 후 출력하기
 */


class Calculator {
    
    // 더하기
    func add(_ num1: Int, _ num2: Int) -> Void {
        print("\(num1) + \(num2) = \(num1 + num2) 입니다.")
    }
    // 빼기
    func substract(_ num1: Int, _ num2: Int) -> Void {
        print("\(num1) - \(num2) = \(num1 - num2) 입니다.")
    }
    // 곱하기
    func multiply(_ num1: Int, _ num2: Int) -> Void {
        print("\(num1) × \(num2) = \(num1 * num2) 입니다.")
    }
    // 나누기
    func devide(_ num1: Int, _ num2: Int) -> Void {
        print("\(num1) ÷ \(num2) = \(num1 / num2) 입니다.")
    }
    // 나머지
    func mod(_ num1: Int, _ num2: Int) -> Void {
        print("\(num1)를 \(num2)로 나눈 나머지 값은 \(num1 % num2) 입니다.")
    }
    
}

let calc = Calculator() // 인스턴스 생성

calc.add(1, 2)
calc.substract(10, 5)
calc.multiply(3, 8)
calc.devide(4, 2)

calc.mod(9, 4)
