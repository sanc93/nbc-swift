//
//  ViewController.swift
//  ColorApp
//
//  Created by Sanghun K. on 2023/07/31.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let data = ["apple","banana", "cherry", "durian", "elderberry"]
    var tableView: UITableView!
    override func viewDidLoad() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
//        tableView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.height.equalTo(300)
//            make.top.equalToSuperview().offset(100)
//        }
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택", data[indexPath.row])
    }

}

