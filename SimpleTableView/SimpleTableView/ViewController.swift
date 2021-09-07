//
//  ViewController.swift
//  SimpleTableView
//
//  Created by DCS on 06/09/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let btnSimple:UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.tintColor = .white
        btn.setTitle("Simple Table", for: .normal)
        btn.addTarget(self, action: #selector(redirectSimple), for: .touchUpInside)
        btn.backgroundColor = .gray
        return btn
    }()
   
    private let btnCustom:UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.tintColor = .white
        btn.setTitle("Custom Table", for: .normal)
        btn.addTarget(self, action: #selector(redirectCustom), for: .touchUpInside)
        btn.backgroundColor = .gray
        return btn
    }()
    
    private let btnSearch:UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.tintColor = .white
        btn.setTitle("search", for: .normal)
        btn.addTarget(self, action: #selector(redirectSearch), for: .touchUpInside)
        btn.backgroundColor = .gray
        return btn
    }()
    @objc func redirectSimple(){
        
        let vc = SimpleTableVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func redirectCustom(){
        
        let vc = CustomTableVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func redirectSearch(){
        
        let vc = SearchVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       print("running")
        view.addSubview(btnSimple)
        view.addSubview(btnCustom)
        view.addSubview(btnSearch)
    }


    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        btnSimple.frame = CGRect(x: 30, y: view.safeAreaInsets.top + 50, width: view.width - 70, height: 40)
        btnCustom.frame = CGRect(x: 30, y: btnSimple.bottom + 50, width: view.width - 70, height: 40)
        btnSearch.frame = CGRect(x: 30, y: btnCustom.bottom + 50, width: view.width - 70, height: 40)
    }
}

