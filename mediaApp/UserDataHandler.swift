//
//  UserDataHandler.swift
//  mediaApp
//
//  Created by DCS on 04/09/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import CoreData
import UIKit



class UserDataHandler{
    
    
    static let shared = UserDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedObjectContext:NSManagedObjectContext;
    
    
    private init(){
        
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func save() {
        appDelegate.saveContext()
    }
    
    func insert(email:String,password:String,completion : @escaping () -> Void){
        
        let user = User(context: managedObjectContext)
        
        user.email = email;
        user.password = password;
        
        save()
        completion()
    }
    
    
    func fetch() -> [User]{
    
        let fetchRequest:NSFetchRequest<User> = User.fetchRequest()
        
        do {
            let userArray = try managedObjectContext.fetch(fetchRequest)
            return userArray
        } catch  {
            print(error)
            let userArray = [User]()
            return userArray
        }
    }
    
}
