//
//  User+CoreDataProperties.swift
//  PhotoJournal
//
//  Created by casandra grullon on 4/10/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var dob: Date?
    @NSManaged public var favorites: NSSet?

}

// MARK: Generated accessors for favorites
extension User {

    @objc(addFavoritesObject:)
    @NSManaged public func addToFavorites(_ value: Favorite)

    @objc(removeFavoritesObject:)
    @NSManaged public func removeFromFavorites(_ value: Favorite)

    @objc(addFavorites:)
    @NSManaged public func addToFavorites(_ values: NSSet)

    @objc(removeFavorites:)
    @NSManaged public func removeFromFavorites(_ values: NSSet)

}
