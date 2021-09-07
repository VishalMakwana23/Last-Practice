//
//  SearchVC.swift
//  SimpleTableView
//
//  Created by DCS on 07/09/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    
    
    private let stateArray = ["Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttarakhand", "Uttar Pradesh", "West Bengal", "Andaman and Nicobar Islands", "Chandigarh", "Dadra and Nagar Haveli", "Daman and Diu", "Delhi", "Lakshadweep", "Puducherry"]
    
    
    
    private let mySearchbar = UISearchBar()
    
    private let myTableView = UITableView()
    
    private var searchData = [String]()
    private var arrToUse = [String]()
    
    private var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        view.addSubview(mySearchbar)
        mySearchbar.delegate = self
        view.addSubview(myTableView)
        setupTableView()
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mySearchbar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 50)
        myTableView.frame = CGRect(x: 0, y: mySearchbar.bottom, width: view.width, height: view.height - view.safeAreaInsets.top)
    }
   

}


extension SearchVC: UITableViewDelegate,UITableViewDataSource{
    
    
    private func setupTableView(){
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "simple")
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        if searching{
            return searchData.count
        } else {
            return stateArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if searching {
            arrToUse = searchData
        } else {
            arrToUse = stateArray
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "simple", for: indexPath)
        cell.textLabel?.text = arrToUse[indexPath.row]
        return cell
    }
    
    
}


extension SearchVC:UISearchBarDelegate{
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            searching = false
        } else {
            
            searching = true
            searchData = stateArray.filter( {$0.lowercased().hasPrefix(searchText.lowercased())})
        }
        myTableView.reloadData()
        
        
    }
}
