//
//  User+CoreDataProperties.swift
//  CoreData
//
//  Created by retina on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int16
    @NSManaged public var name: String?

}
