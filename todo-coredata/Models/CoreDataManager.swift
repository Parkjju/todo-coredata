//
//  CoreDataManager.swift
//  todo-coredata
//
//  Created by Jun on 2023/02/02.
//

import UIKit
import CoreData

class CoreDataManager{
    static let shared = CoreDataManager()
    
    private init(){}
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    let modelName: String = "MemoData"
    
    func getTodoFromCoreData() -> [MemoData]{
        var todoData: [MemoData] = []
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            let dateOrder = NSSortDescriptor(key: "date", ascending: false)
            request.sortDescriptors = [dateOrder]
            
            do{
                if let fetchedTodolist = try context.fetch(request) as? [MemoData] {
                    todoData = fetchedTodolist
                }
            }catch {
                print("TODO LOAD FAILED")
            }
            
        }
        
        return todoData
    }
    
    func appendTodo(todoText: String?, colorInt: Int64, completion: @escaping () -> Void){
        if let context = context {
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context){
                
                if let todoData = NSManagedObject(entity: entity, insertInto: context) as? MemoData{
                    todoData.memoText = todoText
                    todoData.color = colorInt
                    todoData.date = Date()
                    
                    if context.hasChanges{
                        do{
                            try context.save()
                            completion()
                        }catch {
                            print("SAVE ERROR")
                            completion()
                        }
                    }
                }
            }
        }
        completion()
    }
}
