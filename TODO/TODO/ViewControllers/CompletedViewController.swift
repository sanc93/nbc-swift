//
//  CompletedViewController.swift
//  TODO
//
//  Created by Sanghun K. on 2023/08/03.
//

import UIKit

class CompletedViewController: UIViewController {

    // TODO 입력값 저장할 배열
    var completedToDoTasks = [ToDoTask]() {
        didSet {
            if completedToDoTasks.isEmpty {
                self.emptyCompletedTasksUILabel.isHidden = false
            } else {
                self.emptyCompletedTasksUILabel.isHidden = true
            }
        }
    }
    
    @IBOutlet var emptyCompletedTasksUILabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    let toDoTasksKey = "ToDoTasks" // UserDefaults Key값
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // UserDefaults로부터 저장된 데이터 가져와서 toDoTask 배열에 넣기
        if let savedData = UserDefaults.standard.object(forKey: toDoTasksKey) as? Data {
            let decoder = JSONDecoder()
            if let savedObject = try? decoder.decode([ToDoTask].self, from: savedData) {
                completedToDoTasks = savedObject.filter { task in
                    return task.isCompleted == true
                }
            }
            
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }

   
}

extension CompletedViewController : UITableViewDelegate {
    
}

extension CompletedViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedToDoTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "completed_cell", for: indexPath) as! CompletedCustomCell
        
        cell.inputText.text = completedToDoTasks[indexPath.row].inputText
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.string(from: completedToDoTasks[indexPath.row].date)
        cell.date.text = date
        return cell
    }
    
    
}
