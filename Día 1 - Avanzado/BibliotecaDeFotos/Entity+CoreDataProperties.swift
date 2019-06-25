//
//  Entity+CoreDataProperties.swift
//  BibliotecaDeFotos
//
//  Created by Rodrigo Vivas on 6/24/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var texttitle: String?
    @NSManaged public var textdescription: String?
    @NSManaged public var image: NSData?

}
