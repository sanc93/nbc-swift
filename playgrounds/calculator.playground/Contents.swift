import UIKit
/*
- Lv1 : 더하기, 빼기, 나누기, 곱하기 연산을 수행할 수 있는 Calculator 클래스를 만들고, 클래스를 이용하여 연산을 진행하고 출력하기
- Lv2 : Lv1에서 만든 Calculator 클래스에 나머지 연산을 가능하도록 코드를 추가하고, 연산 진행 후 출력하기
- Lv3 : AddOperation(더하기), SubstractOperation(빼기), MultiplyOperation(곱하기), DivideOperation(나누기)
        연산 클래스를 만든 후 클래스간의 관계를 고려하여 Calculator 클래스와 관계를 맺기
 */

// 더하기 클래스
class AddOperation {
    func calculate(_ num1: Int, _ num2: Int) -> Int {
        return num1 + num2
   }
}

// 빼기 클래스
class SubstractOperation {
    func calculate(_ num1: Int, _ num2: Int) -> Int {
        return num1 - num2
   }
}

// 곱하기 클래스
class MultiplyOperation {
    func calculate(_ num1: Int, _ num2: Int) -> Int {
        return num1 * num2
   }
}
// 나누기 클래스
class DivideOperation {
    func calculate(_ num1: Int, _ num2: Int) -> Int {
        return num1 / num2
   }
}

// 나머지 클래스
class ModOperation {
    func calculate(_ num1: Int, _ num2: Int) -> Int {
        return num1 % num2
   }
}

// 계산기 클래스
class Calculator {
    
    let add = AddOperation()
    let substract = SubstractOperation()
    let multiply = MultiplyOperation()
    let divide = DivideOperation()
    let mod = ModOperation()
    
    // 더하기
    func add(_ num1: Int, _ num2: Int) -> Void {
        let result = add.calculate(num1, num2)
        print("\(num1) + \(num2) = \(result) 입니다.")
    }
    // 빼기
    func substract(_ num1: Int, _ num2: Int) -> Void {
        let result = substract.calculate(num1, num2)
        print("\(num1) - \(num2) = \(result) 입니다.")
    }
    // 곱하기
    func multiply(_ num1: Int, _ num2: Int) -> Void {
        let result = multiply.calculate(num1, num2)
        print("\(num1) × \(num2) = \(result) 입니다.")
    }
    // 나누기
    func divide(_ num1: Int, _ num2: Int) -> Void {
        guard num2 != 0 else {
            return print("숫자를 0으로 나눌 수 없습니다.")
        }
        let result = divide.calculate(num1, num2)
        print("\(num1) × \(num2) = \(result) 입니다.")
    }
    // 나머지
    func mod(_ num1: Int, _ num2: Int) -> Void {
        guard num2 != 0 else {
            return print("숫자를 0으로 나눌 수 없습니다.")
        }
        let result = mod.calculate(num1, num2)
        print("\(num1)를 \(num2)로 나눈 나머지 값은 \(result) 입니다.")
    }
    
}

let calc = Calculator()

calc.add(1,2)
calc.substract(10, 5)
calc.multiply(3, 8)
calc.divide(4, 1)
calc.mod(9, 2)

calc.divide(4, 0)
calc.mod(9, 0)

