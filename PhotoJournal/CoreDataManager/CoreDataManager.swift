//
//  CoreDataManager.swift
//  PhotoJournal
//
//  Created by casandra grullon on 4/10/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    private var users = [User]()
    
    private var favorites = [Favorite]()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    public func createUser(name: String, dob: Date) -> User {
        
        let user = User(entity: User.entity(), insertInto: context)
        user.name = name
        user.dob = dob
        
        do {
            try context.save()
        } catch {
            print("failed to create user \(error.localizedDescription)")
        }
        return user
    }
    public func fetchUsers() -> [User] {
        do {
            users = try context.fetch(User.fetchRequest())
        } catch {
            print("unable to get users \(error.localizedDescription)")
        }
        return users
    }
    
    public func addToFavorite(photoURL: String, title: String, user: User) -> Favorite {
        let favorite = Favorite(entity: Favorite.entity(), insertInto: context)
        favorite.photoURL = photoURL
        favorite.user = user
        
        do {
            try context.save()
        } catch {
            print("unable to create favorite \(error.localizedDescription)")
        }
        
        return favorite
    }
    
    public func fetchFavorites() -> [Favorite] {
        do {
            favorites = try context.fetch(Favorite.fetchRequest())
        } catch {
            print("unable to get favorites \(error.localizedDescription)")
        }
        return favorites
    }
    
    public func deleteFromFavorites(_ favorite: Favorite) -> Bool {
        var wasDeleted = false
        context.delete(favorite)
        do {
            try context.save()
            wasDeleted = true
        } catch {
            print("unable to delete from favorites \(error.localizedDescription)")
        }
        return wasDeleted
    }
    

    
    
}
