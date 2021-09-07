//
//  CityCell.swift
//  SimpleTableView
//
//  Created by DCS on 07/09/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    private let myLabel:UILabel = {
        let label = UILabel()
       label.font = UIFont(name: "", size: 20)
        return label
    }()
    
    public let myButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "right"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    func setupCityCellzWith(title name:String, and index:Int){
        
        myImageView.image = UIImage(named: name)
        myLabel.text = name
        myButton.tag = index
        
        setupUi(at: index)
        
    }
    
    private func setupUi(at index:Int){
        
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        contentView.addSubview(myButton)
        
        myImageView.frame = CGRect(x: 20, y: 10, width: 80, height: 80)
        myLabel.frame = CGRect(x: myImageView.right + 20, y: 10, width: 140, height: 80)
        myButton.frame = CGRect(x: contentView.width - 80, y: 10, width: 40, height: 80)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
