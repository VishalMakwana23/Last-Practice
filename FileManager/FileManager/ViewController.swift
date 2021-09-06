//
//  ViewController.swift
//  FileManager
//
//  Created by DCS on 06/09/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var notesArray = [String]()
    private let notesTableView = UITableView()
    
//    private func getDocDir() -> URL {
//
//        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//
//        print("Doc url is \(path[0])")
//
//        return path[0]
//    }
    
    
    private func fetchNote(){
        
//        let service = DataService()
        let path = DataService.getDocDir()
        
        do {
             let items = try FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil)
            
            notesArray.removeAll()
            
            for item in items {
                notesArray.append(item.lastPathComponent)
            }
        } catch  {
            print(error)
        }
        
        notesTableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchNote()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = .white
        title = "My Notes"
        view.addSubview(notesTableView)
        setupTableview()
        
   
        
        
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(redirectNewNote))
        navigationItem.setRightBarButton(addItem, animated: true)
    }

    @objc func redirectNewNote(){
        let vc = NewNotesVC()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        notesTableView.frame = view.bounds
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{


    private func setupTableview(){
        notesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "note")
        notesTableView.delegate = self
        notesTableView.dataSource = self

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "note", for: indexPath)
        cell.textLabel?.text = notesArray[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = NewNotesVC()
        vc.updateFile = notesArray[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let fileName = notesArray[indexPath.row]
        
        let filePath = DataService.getDocDir().appendingPathComponent(fileName)
        print(filePath)
        
        do {
            try FileManager.default.removeItem(at: filePath)
        } catch  {
            print(error)
        }
        
        
        notesArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
