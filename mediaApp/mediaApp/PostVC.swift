//
//  PostVC.swift
//  mediaApp
//
//  Created by DCS on 04/09/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class PostVC: UIViewController {
    
    
    private var postArray = [Post]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        postArray = postDataHandler.shared.fetch()
        
        postTableView.reloadData()
    }
    
    private let postTableView = UITableView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Post"
       self.view.backgroundColor = .white
        view.addSubview(postTableView)
        
        
        let additem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(redirectAddPost))
        navigationItem.setRightBarButton(additem, animated: true)
        
        setuptableView()
    }
    
    @objc func redirectAddPost(){
        
        let vc = AddPostVC()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        postTableView.frame = view.bounds
    }

}


extension PostVC:UITableViewDelegate,UITableViewDataSource{
    
    
    private func setuptableView(){
        
        postTableView.delegate = self
        postTableView.dataSource = self
        postTableView.register(UITableViewCell.self, forCellReuseIdentifier: "post")
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "post", for: indexPath)
        let post = postArray[indexPath.row]
        cell.textLabel?.text = "\(post.name!) | \(post.content!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AddPostVC()
        
        vc.postUpd = postArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let post = postArray[indexPath.row]
        
        postDataHandler.shared.delete(post: post){
            [weak self] in
            
            self?.postArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
}
