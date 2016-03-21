//
//  MyEvent+CoreDataProperties.swift
//  otherCore
//
//  Created by Gastby on 16/3/21.
//  Copyright © 2016年 Gastby. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MyEvent {

    @NSManaged var name: String?
    @NSManaged var happenDate: NSDate?

}
