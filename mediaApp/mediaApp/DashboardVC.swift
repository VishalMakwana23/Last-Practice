//
//  DashboardVC.swift
//  mediaApp
//
//  Created by DCS on 04/09/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {

    private func checkAuth(){
        
        if let email = UserDefaults.standard.string(forKey: "email")
        {
            print(email)
        }
        else{
            let vc = LoginVC()
            
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            nav.setNavigationBarHidden(true, animated: false)
            present(nav,animated: true)
        }
    }
  
    
       
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkAuth();
    }
    
    private let btnPost:UIButton = {
        let button = UIButton()
        button.setTitle("Post", for: .normal)
        button.addTarget(self, action: #selector(redirectPost), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc func redirectPost(){
        
        let vc = PostVC()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    private let btnLogout:UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(redirectRegister), for: .touchUpInside)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 6
        return button
    }()
    
    
    @objc func redirectRegister(){
        
        UserDefaults.standard.set(nil, forKey: "email")
        let vc = LoginVC()
        
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.setNavigationBarHidden(true, animated: false)
        present(nav,animated: true)
        
    }


override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .white
    
    title =  "dashboard"
    
    view.addSubview(btnPost)
    view.addSubview(btnLogout)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        btnPost.frame = CGRect(x: 30, y: view.safeAreaInsets.top + 100 , width: view.width - 70, height: 40)
        btnLogout.frame = CGRect(x: 30, y: btnPost.top + 100 , width: view.width - 70, height: 40)
        
    }
}
