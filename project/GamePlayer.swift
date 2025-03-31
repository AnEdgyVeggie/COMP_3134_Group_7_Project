//
//  User.swift
//  project
//
//  Created by Ethan Sylvester on 2025-03-31.
//
import CoreData
import UIKit

@objc(GamePlayer)
class GamePlayer: NSManagedObject{
     
    @NSManaged var id: NSNumber!
    @NSManaged var username: String!
    @NSManaged var score: NSNumber!
     
}
