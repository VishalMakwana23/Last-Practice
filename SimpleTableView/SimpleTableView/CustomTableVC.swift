//
//  CustomTableVC.swift
//  SimpleTableView
//
//  Created by DCS on 06/09/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import UIKit

class CustomTableVC: UIViewController {

    private var cityArray = ["Berlin","Moscow","Rio","danver","helsinki","Oslo","Nairobi"]
    
    private let myTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "custom table"
        self.view.backgroundColor = .white
        view.addSubview(myTableView)
        setupTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(shuffledata))
    }
    
    @objc func shuffledata(){
        cityArray.shuffle()
        myTableView.reloadData()
        print("shuffle clicked")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTableView.frame = view.bounds
    }
    
    
}

extension CustomTableVC: UITableViewDelegate,UITableViewDataSource{
    
    
    private func setupTableView(){
        myTableView.register(CityCell.self, forCellReuseIdentifier: "citycell")
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citycell", for: indexPath) as! CityCell
        
        cell.setupCityCellzWith(title: cityArray[indexPath.row], and: indexPath.row)
        cell.myButton.addTarget(self, action: #selector(openCityDetail), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(cityArray[indexPath.row])
    }
    
    
    @objc func openCityDetail(_ sender:UIButton){
        
        print(sender.tag)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == .delete {
            
            myTableView.beginUpdates()
            cityArray.remove(at: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .automatic)
            myTableView.endUpdates()
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
