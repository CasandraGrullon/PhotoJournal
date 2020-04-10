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
    
    
    
}
