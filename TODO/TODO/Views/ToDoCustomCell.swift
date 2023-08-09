//
//  ToDoCustomCell.swift
//  TODO
//
//  Created by Sanghun K. on 2023/08/08.
//

import UIKit

class ToDoCustomCell: UITableViewCell {

    @IBOutlet var completedBtn: UIButton!
    @IBOutlet var inputText: UILabel!
    @IBOutlet var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func completedBtn(_ sender: Any) {
    }
}