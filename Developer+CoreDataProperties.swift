//
//  Developer+CoreDataProperties.swift
//  Save with CoreData
//
//  Created by Frank Bara on 2/17/20.
//  Copyright © 2020 BaraLabs. All rights reserved.
//
//

import Foundation
import CoreData


extension Developer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Developer> {
        return NSFetchRequest<Developer>(entityName: "Developer")
    }

    @NSManaged public var username: String?
    @NSManaged public var imageD: Data?
    @NSManaged public var favo: Bool
    @NSManaged public var descriptions: String?
    @NSManaged public var loved: Bool

}
