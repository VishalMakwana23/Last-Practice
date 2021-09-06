//
//  AddPostVC.swift
//  mediaApp
//
//  Created by DCS on 04/09/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {

    var postUpd:Post?
    
    private let txtname:UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter name"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()
    
    
    private let txtcontent:UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter content"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()
    private let btnsave:UIButton = {
        let button = UIButton()
        button.setTitle("save", for: .normal)
        button.addTarget(self, action: #selector(redirectPost), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 6
        return button
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        view.addSubview(txtname)
        view.addSubview(txtcontent)
        view.addSubview(btnsave)
        
        
        
        if let post = postUpd {
            
            txtname.text = post.name
            txtcontent.text = post.content
            
        }
        
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        txtname.frame = CGRect(x: 30, y: view.safeAreaInsets.top + 50, width: view.width - 70 , height: 40)
        txtcontent.frame = CGRect(x: 30, y: txtname.bottom + 20, width: view.width - 70 , height: 200)
        btnsave.frame = CGRect(x: 30, y: txtcontent.bottom + 20, width: view.width - 70 , height: 40)
    }

    
    @objc func redirectPost(){
        
        
        let name = txtname.text!
        let content = txtcontent.text!
        
        
        if let post = postUpd{
            
            postDataHandler.shared.update(post: post, name: name, content: content){
                
                [weak self] in
                
                self?.navigationController?.popViewController(animated: true)
            }
            
        }else{
            postDataHandler.shared.insert(name: name, content: content){
                
                [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        }
        
       
        
    }
    
}
