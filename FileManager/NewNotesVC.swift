//
//  NewNotesVC.swift
//  FileManager
//
//  Created by DCS on 06/09/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import UIKit

class NewNotesVC: UIViewController {
    
    
    
    var updateFile = ""
    
    
    
    
    
    private let txtname:UITextField = {
        let textField = UITextField()
        textField.placeholder = "This is a text field"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()
    
    
    private let txtcontent:UITextField = {
        let textField = UITextField()
        textField.placeholder = "This is a text field"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()

    private let btnsave:UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(redirectSaveNote), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 6
        return button
    }()
    
    
    @objc func redirectSaveNote(){
        let name = txtname.text!
        let content = txtcontent.text!
        
//        let service = DataService()
        
        let filePath = DataService.getDocDir().appendingPathComponent("\(name).txt")
        do {
            try content.write(to: filePath, atomically: true, encoding: .utf8)
            
           // let fetchedContent = try String(contentsOf: filePath)
           // print(fetchedContent)
            
            txtname.text = ""
            txtcontent.text = ""
            
            
            let alert = UIAlertController(title: "Success", message: "Notes save successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: {
                
                [weak self] _ in
                
              
                self?.navigationController?.popViewController(animated: true)
                
            }))
            DispatchQueue.main.async {
                self.present(alert,animated:true,completion:nil)
            }
        } catch  {
            print(error)
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        view.addSubview(txtname)
        view.addSubview(txtcontent)
        view.addSubview(btnsave)
        
        
        if updateFile != "" {
            
            txtname.text = updateFile.components(separatedBy: ".").first
            txtname.isEnabled = false
            
            let filePath = DataService.getDocDir().appendingPathComponent(updateFile)
            
            do{
                let content = try String(contentsOf: filePath)
                txtcontent.text = content
            } catch {
                print(error)
            }   
        }
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        txtname.frame = CGRect(x: 30, y: view.safeAreaInsets.top + 50 , width: view.width - 70, height: 40)
        txtcontent.frame = CGRect(x: 30, y: txtname.bottom + 20 , width: view.width - 70, height: 200)
        btnsave.frame = CGRect(x: 30, y: txtcontent.bottom + 20 , width: view.width - 70, height: 40)
    }

}
