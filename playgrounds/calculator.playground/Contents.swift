import UIKit
/*
- Lv1 : 더하기, 빼기, 나누기, 곱하기 연산을 수행할 수 있는 Calculator 클래스를 만들고, 클래스를 이용하여 연산을 진행하고 출력하기
 */


class Calculator {
    
    // 더하기
    func add(_ num1: Int, _ num2: Int) -> Void {
        print("[addOperation] \(num1) + \(num2) = \(num1 + num2) 입니다.")
    }
    // 빼기
    func substract(_ num1: Int, _ num2: Int) -> Void {
        print("[substractOperation] \(num1) - \(num2) = \(num1 - num2) 입니다.")
    }
    // 곱하기
    func multiply(_ num1: Int, _ num2: Int) -> Void {
        print("[multiplyOperation] \(num1) × \(num2) = \(num1 * num2) 입니다.")
    }
    // 나누기
    func devide(_ num1: Int, _ num2: Int) -> Void {
        print("[devideOperation] \(num1) ÷ \(num2) = \(num1 / num2) 입니다.")
    }
    
}

let calc = Calculator() // 인스턴스 생성
calc.add(1, 2)
calc.substract(10, 5)
calc.multiply(3, 8)
calc.devide(4, 2)
