//
//  DataService.swift
//  FileManager
//
//  Created by DCS on 06/09/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import Foundation


class DataService{
    
    
     static func getDocDir() -> URL {
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        print("Doc url is \(path[0])")
        
        return path[0]
    }
    
    
}
