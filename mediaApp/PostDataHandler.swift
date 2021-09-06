//
//  PostDataHandler.swift
//  mediaApp
//
//  Created by DCS on 04/09/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import CoreData
import UIKit



class postDataHandler{
    
    
    static let shared = postDataHandler()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedObjectContext:NSManagedObjectContext;
    
    
    private init(){
        
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    func save() {
        appDelegate.saveContext()
    }
    
    func insert(name:String,content:String,completion : @escaping () -> Void){
        
        let post = Post(context: managedObjectContext)
        
        post.name = name;
        post.content = content;
        
        save()
        completion()
    }
    

    func update(post:Post,name:String,content:String,completion : @escaping () -> Void){
 
        post.name = name;
        post.content = content;
        
        save()
        completion()
    }
    
    func delete(post:Post,completion : @escaping () -> Void){
        
        
        managedObjectContext.delete(post)
        
        save()
        completion()
    }
    
    func fetch() -> [Post]{
        
        let fetchRequest:NSFetchRequest<Post> = Post.fetchRequest()
        
        do {
            let postArray = try managedObjectContext.fetch(fetchRequest)
            return postArray
        } catch  {
            print(error)
            let postArray = [Post]()
            return postArray
        }
    }
    
}
