//
//  ToDoViewController.swift
//  TODO
//
//  Created by Sanghun K. on 2023/08/03.
//

import UIKit

class ToDoViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var toDoTasks = [String]() // TODO 입력값 모두 저장할 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource .self
        
        // 현재 배열에 저장된 값(사용자가 입력한 TODO값들) 모두 가져오기
        
        
    }
    
    // + 버튼 눌렀을 때 UIAlertController로 TODO값 입력 (Lv.2)
    @IBAction func AddToDoTaskBtn() {
        let alertController = UIAlertController(title: "신규", message: "해야할 일을 입력해주세요.", preferredStyle: .alert)
        
        
        let submit = UIAlertAction(title: "확인", style: .default) { (action) in
            if let textField = alertController.textFields?.first, let inputText = textField.text {
                        // 텍스트 필드에서 입력된 값을 가져와서 출력
                        print("입력된 값: \(inputText)")
                    }
            
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        // UIAlertController에 위에서 만든 UIAlertAction들과, 텍스트필드 장착
        alertController.addAction(submit)
        alertController.addAction(cancel)
        alertController.addTextField { (textfield) in
            textfield.placeholder = "예) 밥 먹기"
        }
        
        // present 메서드 : 만든 alertController를 모달 방식으로 뷰 컨트롤러 위에 표시
        present(alertController, animated: true, completion: nil)
            
        }
        
        
        @IBAction func myButtonTouched(_ sender: Any) {

                let alert = UIAlertController(title: "alert", message: "textField", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
                     //code

                }
                let cancel = UIAlertAction(title: "cancel", style: .cancel) { (cancel) in
                     //code

                }
                

            }

}

extension ToDoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ToDoViewController: UITableViewDataSource {
    
    // 1. 테이블 row수(toDoTasks배열의 항목 수) 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoTasks.count
    }
    
    // 2. 실제 값(toDoTasks배열의 내용물)을 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = toDoTasks[indexPath.row]
        
        return cell
    }
}
