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
    
    var todoData: MemoData?{
        didSet{
            temporaryNum = todoData?.color
        }
    }
    
    var temporaryNum: Int64? = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configureUI()
        clearButtonUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttons.forEach { button in
            button.clipsToBounds = true
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
    
    func configureUI(){
        if let todoData = self.todoData{
            print(todoData)
        }else {
            self.title = "새로운 투두 작성하기"
        }
    }
    
    func setup(){
//        mainTextView.delegate = self
        
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 10
        
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 8
    }
    
    @IBAction func colorButtonTapped(_ sender: UIButton) {
        self.temporaryNum = Int64(sender.tag)
        let color = MyColor(rawValue: Int64(sender.tag))
        setupViewColor(color: color)
        clearButtonUI()
        setupColorButton(num: Int64(sender.tag))
    
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if let todoData = todoData {
            print(todoData)
        }else {
            todoManager.appendTodo(todoText: todoData?.memoText, colorInt: temporaryNum ?? 1) {
                
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func setupViewColor(color: MyColor? = .red){
        backgroundView.backgroundColor = color?.backgroundColor
        mainTextView.backgroundColor = color?.backgroundColor
        saveButton.backgroundColor = color?.backgroundColor
        
    }
    
    
    
    func setupColorButton(num: Int64){
        switch num{
        case 1:
            redButton.backgroundColor = MyColor.red.buttonColor
            redButton.setTitleColor(.white, for: .normal)
        case 2:
            greenButton.backgroundColor = MyColor.green.buttonColor
            greenButton.setTitleColor(.white, for: .normal)
        case 3:
            blueButton.backgroundColor = MyColor.blue.buttonColor
            blueButton.setTitleColor(.white, for: .normal)
        case 4:
            purpleButton.backgroundColor = MyColor.purple.buttonColor
            purpleButton.setTitleColor(.white, for: .normal)
        default:
            break
        }
    }
    
    
    
    
    func clearButtonUI(){
        buttons.forEach { button in
            switch button{
            case redButton:
                button.backgroundColor = MyColor.red.backgroundColor
                button.setTitleColor(MyColor.red.buttonColor, for: .normal)
            case blueButton:
                button.backgroundColor = MyColor.blue.backgroundColor
                button.setTitleColor(MyColor.blue.buttonColor, for: .normal)
            case greenButton:
                button.backgroundColor = MyColor.green.backgroundColor
                button.setTitleColor(MyColor.green.buttonColor, for: .normal)
            case purpleButton:
                button.backgroundColor = MyColor.purple.backgroundColor
                button.setTitleColor(MyColor.purple.buttonColor, for: .normal)
            default:
                break
            }
        }
    }
    
    
}
