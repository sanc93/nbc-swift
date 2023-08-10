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
    
    // toDoTasks : TODO 입력 값 저장 되는 배열
    var toDoTasks = [ToDoTask]() {
        didSet {
            if toDoTasks.isEmpty {
                self.emptyTasksUILabel.isHidden = false
            } else {
                self.emptyTasksUILabel.isHidden = true
            }
        }
    }
    
    let toDoTasksKey = "ToDoTasks"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UserDefaults로부터 저장된 데이터 로드 -> toDoTasks 배열에 넣기
        if let savedData = UserDefaults.standard.object(forKey: toDoTasksKey) as? Data {
            let decoder = JSONDecoder()
            if let savedObject = try? decoder.decode([ToDoTask].self, from: savedData) {
                toDoTasks = savedObject
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // + 버튼 터치 시
    @IBAction func AddToDoTaskBtn() {
        let alertController = UIAlertController(title: "해야할 일을 입력해주세요", message: "", preferredStyle: .alert)
        // "확인" 눌렸을 때 처리 내용
        let submit = UIAlertAction(title: "확인", style: .default) { _ in
            if let textField = alertController.textFields?.first, let inputText = textField.text {
                let newTask = ToDoTask(id: UUID(), inputText: inputText, date: Date(), isCompleted: false)
                self.toDoTasks.append(newTask)
                self.tableView.reloadData()
                
                let encoder = JSONEncoder()
                if let encodedToDoTasks = try? encoder.encode(self.toDoTasks) {
                    UserDefaults.standard.setValue(encodedToDoTasks, forKey: self.toDoTasksKey)
                }
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alertController.addAction(submit)
        alertController.addAction(cancel)
        alertController.addTextField { (textfield) in
            textfield.placeholder = "예) 밥 먹기"
        }
        
        present(alertController, animated: true, completion: nil) // present 메서드 : 만든 alertController를 모달 방식으로 뷰 컨트롤러 위에 표시
    }
}

extension ToDoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ToDoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "todo_cell", for: indexPath) as! ToDoCustomCell
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
    
    // leadingSwipeActionsConfigurationForRowAt : row를 왼쪽 → 오른쪽 스와이프 시
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let moveToCompletedList = UIContextualAction(style: .normal, title: self.toDoTasks[indexPath.row].isCompleted ? "처리 완료 취소" : "처리 완료 하기" ) { (_, _, success) in

            self.toDoTasks[indexPath.row].isCompleted.toggle()
            
            let encoder = JSONEncoder()
            if let encodedToDoTasks = try? encoder.encode(self.toDoTasks) {
                UserDefaults.standard.set(encodedToDoTasks, forKey: self.toDoTasksKey)
            }
            
            tableView.reloadData()
            success(true)
        }
        moveToCompletedList.backgroundColor = self.toDoTasks[indexPath.row].isCompleted ? .lightGray : .init(red: 0.51, green: 0.74, blue: 0.14, alpha: 1.0) // #83BC25
        
        return UISwipeActionsConfiguration(actions: [moveToCompletedList])
    }
    
    // trailingSwipeActionsConfigurationForRowAt : row를 오른쪽 → 왼쪽 스와이프 시
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: nil) { (_, _, success) in
            
            self.toDoTasks.remove(at: indexPath.row)
            
            let encoder = JSONEncoder()
            if let encodedToDoTasks = try? encoder.encode(self.toDoTasks) {
                UserDefaults.standard.set(encodedToDoTasks, forKey: self.toDoTasksKey)
            }
            
            tableView.reloadData()
            success(true)
            
        }
        
        delete.backgroundColor = .red
        delete.image = UIImage(systemName: "trash")

        return UISwipeActionsConfiguration(actions: [delete])
    }
}

