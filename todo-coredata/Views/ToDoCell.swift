//
//  ToDoCell.swift
//  todo-coredata
//
//  Created by Jun on 2023/02/02.
//

import UIKit

class ToDoCell: UITableViewCell {

    
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var toDoTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    var toDoData: MemoData? {
        didSet{
            configureUIWithData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
