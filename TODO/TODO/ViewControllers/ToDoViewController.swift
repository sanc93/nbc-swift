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
    var toDoTasks = [ToDoTask]() {
        didSet { // didset: toDoTask에 변화가 감지되면 아래 코드블럭이 호출된다
            if toDoTasks.isEmpty {
                self.emptyTasksUILabel.isHidden = false // 배열이 비어있으면 UILabel 숨기기
            } else {
                self.emptyTasksUILabel.isHidden = true // 배열에 값이 있으면 UILabel 보이기
            }
        }
    }
    
    let toDoTasksKey = "ToDoTasks" // UserDefaults Key값
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // UserDefaults로부터 저장된 데이터 가져와서 toDoTask 배열에 넣기
        if let savedData = UserDefaults.standard.object(forKey: toDoTasksKey) as? Data {
            let decoder = JSONDecoder()
            if let savedObject = try? decoder.decode([ToDoTask].self, from: savedData) {
                toDoTasks = savedObject
            }
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // + 버튼 눌렀을 때 UIAlertController로 TODO값 입력 (Lv.2)
    @IBAction func AddToDoTaskBtn() {
        let alertController = UIAlertController(title: "해야할 일을 입력해주세요", message: "", preferredStyle: .alert)
        let submit = UIAlertAction(title: "확인", style: .default) { _ in
            if let textField = alertController.textFields?.first, let inputText = textField.text {
                
                let newTask = ToDoTask(id: UUID(), inputText: inputText, date: Date(), isCompleted: false)
                self.toDoTasks.append(newTask)
                self.tableView.reloadData() // 테이블 뷰를 리프레시
                

                
                let encoder = JSONEncoder()
                if let encodedToDoTasks = try? encoder.encode(self.toDoTasks) { // toDoTasks 배열을 Data형으로 변환
                    UserDefaults.standard.setValue(encodedToDoTasks, forKey: self.toDoTasksKey) // toDoTasks를 UserDefaults에 저장
                }
                
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

    
}

// UITableViewDataSource : 테이블 뷰에 표시될 데이터의 개수, 셀의 내용, 섹션의 개수 등을 제공
extension ToDoViewController: UITableViewDataSource {
    
    // 1. 테이블 row수(toDoTasks배열의 항목 수) 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoTasks.count
    }
    
    // 2. 실제 값(toDoTasks배열의 내용물)을 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "todo_cell", for: indexPath) as! ToDoCustomCell
        
//        cell.inputText.text = toDoTasks[indexPath.row].inputText
        
        let selectedTask = toDoTasks[indexPath.row]
        
        if selectedTask.isCompleted {
            cell.inputText.attributedText = selectedTask.inputText.strikeThrough()
            cell.completeStatus(isCompleted: true)
        } else {
            cell.inputText.attributedText = NSAttributedString(string: selectedTask.inputText)
            cell.completeStatus(isCompleted: false)
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.string(from: toDoTasks[indexPath.row].date)
        cell.date.text = date
        return cell
    }
    
    // row 스와이프(왼쪽)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let moveToCompletedList = UIContextualAction(style: .normal, title: "처리 완료") { (_, _, success) in
            
            self.toDoTasks[indexPath.row].isCompleted.toggle()
            
            let encoder = JSONEncoder()
            if let encodedToDoTasks = try? encoder.encode(self.toDoTasks) {
                UserDefaults.standard.set(encodedToDoTasks, forKey: self.toDoTasksKey) // toDoTasks배열을 UserDefaults에 반영
            }
            // 테이블 뷰 리로드
            tableView.reloadData()
            print(self.toDoTasks)
            success(true)
        }
        moveToCompletedList.backgroundColor = .init(red: 0.51, green: 0.74, blue: 0.14, alpha: 1.0) // #83BC25
        return UISwipeActionsConfiguration(actions: [moveToCompletedList])
    }
    
    // row 스와이프(오른쪽)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: nil) { (_, _, success) in
            
            self.toDoTasks.remove(at: indexPath.row) // toDoTasks배열에서 해당 row와 같은 값 삭제
            
            let encoder = JSONEncoder()
            if let encodedToDoTasks = try? encoder.encode(self.toDoTasks) {
                UserDefaults.standard.set(encodedToDoTasks, forKey: self.toDoTasksKey) // toDoTasks배열을 UserDefaults에 반영
            }
            
            // 테이블 뷰 리로드
            tableView.reloadData()
            success(true)
            
        }
        delete.backgroundColor = .red
        delete.image = UIImage(systemName: "trash")

        return UISwipeActionsConfiguration(actions: [delete])
    }
    
}

