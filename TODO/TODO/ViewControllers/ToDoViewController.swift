//
//  ToDoViewController.swift
//  TODO
//
//  Created by Sanghun K. on 2023/08/03.
//

import UIKit

class ToDoViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var emptyTasksUILabel: UILabel!
    
    // TODO 입력값 저장할 배열
    var toDoTasks = [String]()
    
    let toDoTasksKey = "ToDoTasks" // UserDefaults Key값
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UserDefaults로부터 저장된 데이터 가져와서 toDoTask 배열에 넣기
        if let savedData = UserDefaults.standard.array(forKey: toDoTasksKey) as? [String] {
            toDoTasks = savedData
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // + 버튼 눌렀을 때 UIAlertController로 TODO값 입력 (Lv.2)
    @IBAction func AddToDoTaskBtn() {
        let alertController = UIAlertController(title: "해야할 일을 입력해주세요", message: "", preferredStyle: .alert)
        let submit = UIAlertAction(title: "확인", style: .default) { _ in
            if let textField = alertController.textFields?.first, let inputText = textField.text {
                self.toDoTasks.append(inputText)
                self.tableView.reloadData() // 테이블 뷰를 리프레시
                
                UserDefaults.standard.set(self.toDoTasks, forKey: self.toDoTasksKey) // toDoTasks를 UserDefaults에 저장
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
}



//  TableView 관련..


// UITableViewDelegate : 테이블 뷰에 보여지는 부분이나 눌렀을때 이벤트 등..
extension ToDoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark // TODO: 왼쪽에 체크박스 달기
    }

    // row를 오른쪽으로 스와이프 시 삭제 버튼 나오도록
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: nil) { (_, _, success) in
            
            self.toDoTasks.remove(at: indexPath.row) // toDoTasks배열에서 해당 row와 같은 값 삭제
            UserDefaults.standard.set(self.toDoTasks, forKey: self.toDoTasksKey) // toDoTasks배열을 UserDefaults에 반영
                    
            // 테이블 뷰 리로드
            tableView.reloadData()
            print("delete 클릭 됨")
            success(true)
        }
        delete.backgroundColor = .red
        delete.image = UIImage(systemName: "trash")
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
}

// UITableViewDataSource : 테이블 뷰에 표시될 데이터의 개수, 셀의 내용, 섹션의 개수 등을 제공
extension ToDoViewController: UITableViewDataSource {
    
    // 1. 테이블 row수(toDoTasks배열의 항목 수) 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoTasks.count
    }
    
    // 2. 실제 값(toDoTasks배열의 내용물)을 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = toDoTasks[indexPath.row]
        print("--> ",indexPath)
        return cell
    }
}

