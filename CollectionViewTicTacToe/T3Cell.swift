//
//  T3Cell.swift
//  CollectionViewTicTacToe
//
//  Created by DCS on 04/09/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import UIKit

class T3Cell: UICollectionViewCell {
    
    private let img:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    func setupCell(with status:Int){
        
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        contentView.addSubview(img)
        
        img.frame = CGRect(x: 10, y: 10, width: 80, height: 80)
        
        let name = status == 0 ? "o":status == 1 ? "close" : ""
        
        
        img.image = UIImage(named: name)
    }
    
}
