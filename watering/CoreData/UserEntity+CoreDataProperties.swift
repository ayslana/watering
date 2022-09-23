//
//  UserEntity+CoreDataProperties.swift
//  watering
//
//  Created by Ayslana Riene on 23/09/22.
//
//

import Foundation
import CoreData
import UIKit

extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var plantName: String?
    @NSManaged public var plantType: String?
    @NSManaged public var userName: String?

}
