//
//  LoginVC.swift
//  mediaApp
//
//  Created by DCS on 04/09/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    private var userArray = [User]()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userArray = UserDataHandler.shared.fetch()
    }
    
    
    private let txtEmail:UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter Email"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()
    
    
    private let txtPassword:UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter Pasword"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()
    
    private let btnLogin:UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(redirectDashboard), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc func redirectDashboard(){
        
        let usr_cnt = userArray.count
        
        print(usr_cnt)
        
        for i in 0..<usr_cnt {
            print(userArray[i])
            
            if(txtEmail.text == userArray[i].email) && (txtPassword.text == userArray[i].password){
                
                let vc = LoginVC()
                
                UserDefaults.standard.set(txtEmail.text, forKey: "email")
                navigationController?.pushViewController(vc, animated: true)
                self.dismiss(animated: true)
                break
            }
            else{
                let alert = UIAlertController(title: "Please enter correct detail", message: "incorrect email and password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "close", style: .cancel))
                
                DispatchQueue.main.async {
                    self.present(alert,animated:true)
                    self.txtEmail.text = ""
                    self.txtPassword.text = ""
                }
            }
        }
        
    }
    
    private let btnRegister:UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.addTarget(self, action: #selector(redirectRegister), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 6
        return button
    }()
    
    
    @objc func redirectRegister(){
        
        let vc = RegisterVC()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        view.addSubview(txtEmail)
        view.addSubview(txtPassword)
        view.addSubview(btnLogin)
        view.addSubview(btnRegister)
        
        
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        txtEmail.frame = CGRect(x: 40, y: view.safeAreaInsets.top + 50 , width: view.width - 70 , height: 40)
         txtPassword.frame = CGRect(x: 40, y: txtEmail.bottom + 10 , width: view.width - 70 , height: 40)
         btnLogin.frame = CGRect(x: 40, y: txtPassword.bottom + 10 , width: view.width - 70 , height: 40)
         btnRegister.frame = CGRect(x: 40, y: btnLogin.bottom + 10  , width: view.width - 70 , height: 40)
    }

}

