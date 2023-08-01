//
//  ViewController.swift
//  ColorApp
//
//  Created by Sanghun K. on 2023/07/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Button1: UIButton!
    @IBAction func touchButton(_ sender: Any) {
        self.view.backgroundColor = .yellow
//        print("touch button")
    }
    override func viewDidLoad() {
//        Button1.setTitle("Button 1", for: .normal)
        Button1.titleLabel?.textColor = .blue
        super.viewDidLoad()
        let button = UIButton(type: .system)
        button.setTitle("Push View Controller", for: .normal)
        button.addTarget(self, action: #selector(pushViewController), for: .touchUpInside)
        button.frame = CGRect(x: 200, y: 200, width: 200, height: 100)
        self.view.addSubview(button)
    }
    
    @objc func pushViewController() {
        let newViewController = UIViewController()
        newViewController.title = "New View Controller"
        newViewController.view.backgroundColor = .white
        navigationController?.pushViewController(newViewController, animated: true)
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // 한번 호출 필요
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

}

