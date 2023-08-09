//
//  ToDoCustomCell.swift
//  TODO
//
//  Created by Sanghun K. on 2023/08/08.
//

import UIKit

class ToDoCustomCell: UITableViewCell {

    
    @IBOutlet var completedBtn: UIButton!
    @IBOutlet var uncompletedBtn: UIButton!
    @IBOutlet var inputText: UILabel!
    @IBOutlet var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func completeStatus(isCompleted: Bool) {
           completedBtn.isHidden = !isCompleted
           uncompletedBtn.isHidden = isCompleted
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func uncompletedBtnTapped(_ sender: Any) {
    }
    
}


