//
//  RegisterVC.swift
//  mediaApp
//
//  Created by DCS on 04/09/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

  
    private let txtEmail:UITextField = {
        let textField = UITextField()
        textField.placeholder = "This is a text field"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()
    
    
    private let txtPassword:UITextField = {
        let textField = UITextField()
        textField.placeholder = "This is a text field"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()
    
    private let btnLogin:UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.addTarget(self, action: #selector(redirectLogin), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 6
        return button
    }()
    
   
    
    @objc func redirectLogin(){
        
        let email = txtEmail.text!
        let password = txtPassword.text!
        
        UserDataHandler.shared.insert(email: email, password: password){
            
            [weak self] in
            
            let alert = UIAlertController(title: "Sucess", message: "Registred Successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: {
                
                [weak self] _ in
                
                let vc = LoginVC()
                self?.navigationController?.pushViewController(vc, animated: true)
            }))
            
            DispatchQueue.main.async {
                self?.present(alert,animated:true,completion:nil)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        title = "Rgister"
        view.addSubview(txtEmail)
        view.addSubview(txtPassword)
        view.addSubview(btnLogin)
      
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        txtEmail.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 50 , width: view.width - 70 , height: 40)
        txtPassword.frame = CGRect(x: 40, y: txtEmail.bottom + 10 , width: view.width - 70 , height: 40)
        btnLogin.frame = CGRect(x: 40, y: txtPassword.bottom + 10 , width: view.width - 70 , height: 40)
        
    }


  

}
