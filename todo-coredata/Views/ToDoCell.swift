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
            configureUIwithData()
        }
    }
    
    var updateButtonPressed: (ToDoCell) -> Void = { (sender) in }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    @IBAction func updateButtonTapped(_ sender: UIButton) {
        updateButtonPressed(self)
    }
    
    func configureUIwithData() {
        toDoTextLabel.text = toDoData?.memoText
        dateTextLabel.text = toDoData?.dateString
        guard let colorNum = toDoData?.color else { return }
        let color = MyColor(rawValue: colorNum) ?? .red
        updateButton.backgroundColor = color.buttonColor
        background.backgroundColor = color.backgroundColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
