//
//  ViewController.swift
//  ColorApp
//
//  Created by Sanghun K. on 2023/07/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UILabel
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 300, height: 50))
        label.text = "안녕하세요"
        label.textColor = .green
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        self.view.addSubview(label)
        
        // UIImageView
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        let image = UIImage(systemName: "folder.fill")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
        
        // UITextField
        let textField = UITextField(frame: CGRect(x: 100, y: 100, width: 200, height: 60))
        textField.placeholder = "이름을 입력해주세요"
        self.view.addSubview(textField)
        
        // UIButton
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50 ))
        button.setTitle("버튼", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        self.view.addSubview(button)
        
        // UISwitch
        let mySwitch = UISwitch(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        mySwitch.isOn = true
        mySwitch.onTintColor = .green
        mySwitch.thumbTintColor = .white
        mySwitch.addTarget(self, action: #selector(switchToggled), for: .valueChanged)
        self.view.addSubview(mySwitch)
    }
    
    @objc func buttonAction2() {
        print("버튼을 눌렀습니다.")
    }
    
    @objc func switchToggled() {
        print("switch value changed")
        
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        print("버튼 누르기")
    }
    @IBAction func sliderChange(_ sender: Any) {
        print("slider", sender)
    }
    @IBAction func segment(_ sender: Any) {
        print("segment")
    }
}

