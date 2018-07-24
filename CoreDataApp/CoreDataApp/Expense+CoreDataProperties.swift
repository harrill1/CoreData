//
//  Expense+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by Hayden on 7/23/18.
//  Copyright © 2018 Harrill, Hayden. All rights reserved.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: Double
    @NSManaged public var rawDate: NSDate?

}
