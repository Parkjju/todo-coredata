//
//  ViewController.swift
//  todo-coredata
//
//  Created by Jun on 2023/02/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let toDoManager = CoreDataManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func setupNavigationBar(){
        self.title = "메모"
        
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        navigationItem.rightBarButtonItem = plusButton
    }
    
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
    }
    
    @objc func plusButtonTapped(){
        performSegue(withIdentifier: "ToDoCell", sender: nil)
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


// 데이터소스 추후 정의 필요
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoManager.getTodoFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        let todoData = toDoManager.getTodoFromCoreData()
        
        
        cell.toDoData = todoData[indexPath.row]
        
        cell.updateButtonPressed = { [weak self](senderCell) in
            self?.performSegue(withIdentifier: "ToDoCell", sender: indexPath)
        }
        
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToDoCell", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "ToDoCell"{
            let detailVC = segue.destination as! DetailViewController
            
            guard let indexPath = sender as? IndexPath else {return}
            detailVC.todoData =  toDoManager.getTodoFromCoreData()[indexPath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
