
//
//  SimpleTableVC.swift
//  SimpleTableView
//
//  Created by DCS on 06/09/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import UIKit

class SimpleTableVC: UIViewController {

    
    private let myTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(myTableView)
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTableView.frame = view.bounds
    }
    

}

extension SimpleTableVC: UITableViewDelegate,UITableViewDataSource{
    
    
    private func setupTableView(){
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "simple")
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simple", for: indexPath)
        cell.textLabel?.text = "hello word"
        return cell
    }
    
    
}
