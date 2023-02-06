//
//  MemoData+CoreDataProperties.swift
//  todo-coredata
//
//  Created by Jun on 2023/02/02.
//
//

import Foundation
import CoreData


extension MemoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoData> {
        return NSFetchRequest<MemoData>(entityName: "MemoData")
    }

    @NSManaged public var color: Int64
    @NSManaged public var memoText: String?
    @NSManaged public var date: Date?
    
    var dateString: String?{
        get {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy-MM-dd"
            
            guard let date = self.date else {return ""}
            let savedDateString = dateformatter.string(from: date)
            return savedDateString
        }
    }

}

extension MemoData : Identifiable {

}
