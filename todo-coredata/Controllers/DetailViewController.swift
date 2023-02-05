//
//  DetailViewController.swift
//  todo-coredata
//
//  Created by Jun on 2023/02/05.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    
    lazy var buttons: [UIButton] = {
        return [redButton, greenButton, blueButton, purpleButton]
    }()
    
    
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    let todoManager = CoreDataManager.shared
    
     var todoData: TodoData?
    
    // var temporaryNum: Int64? = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttons.forEach { button in
            button.clipsToBounds = true
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
    
    func setup(){
        mainTextView.delegate = self
        
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 10
        
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 8
        
        clearButtonColors()
    }
    
    func configureUI(){
        if let todoData = self.todoData{
            self.title = "메모 수정하기"
            
            guard let text = todoData.
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
