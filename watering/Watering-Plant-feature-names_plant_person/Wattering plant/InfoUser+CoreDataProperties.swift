//
//  InfoUser+CoreDataProperties.swift
//  Wattering plant
//
//  Created by Narely Lima on 12/09/22.
//
//

import Foundation
import CoreData


extension InfoUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InfoUser> {
        return NSFetchRequest<InfoUser>(entityName: "InfoUser")
    }

    @NSManaged public var name: String?
    @NSManaged public var namePlant: String?
    @NSManaged public var iconPlant: String?
    @NSManaged public var freqWater: String?

}

extension InfoUser : Identifiable {

}
