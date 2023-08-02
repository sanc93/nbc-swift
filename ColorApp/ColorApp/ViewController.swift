//
//  ViewController.swift
//  ColorApp
//
//  Created by Sanghun K. on 2023/07/31.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let pickerView = UIPickerView()
    let data = ["항목1","항목2","항목3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        self.view.addSubview(pickerView)
        pickerView.dataSource = self
        pickerView.delegate = self
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = data[row]
        print("선택", selectedValue)
    }
    

}

