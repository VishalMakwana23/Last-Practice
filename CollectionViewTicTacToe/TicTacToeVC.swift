//
//  TicTacToeVC.swift
//  CollectionViewTicTacToe
//
//  Created by DCS on 04/09/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import UIKit

class TicTacToeVC: UIViewController {
    
    private var state = [2,2,2,
                         2,2,2,
                         2,2,2]
    
    private var zeroFlag = false
    
    private let winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    
    
    
    private let myCollectionView:UICollectionView = {
        
        
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 120, left: 20, bottom: 20, right: 20)
        layout.itemSize = CGSize(width: 100, height: 100)
        
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TicTacToe"
        view.addSubview(myCollectionView)
        setupCollectionView()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myCollectionView.frame = view.bounds
    }

  
 
}


extension TicTacToeVC:UICollectionViewDelegate,UICollectionViewDataSource{
    
    private func setupCollectionView(){
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(T3Cell.self, forCellWithReuseIdentifier: "t3cell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "t3cell", for: indexPath) as! T3Cell
        cell.setupCell(with: state[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if state[indexPath.row] != 0 && state[indexPath.row] != 1 {
            
            state.remove(at: indexPath.row)
            
            if zeroFlag {
                
                state.insert(0, at: indexPath.row)
                
                print("last")
            }else{
                 state.insert(1, at: indexPath.row)
                
                print("first")
            }
            
            zeroFlag = !zeroFlag
            collectionView.reloadData()
            checkWinner()
        }
    }
    
    private func checkWinner(){
        
       
        
        
        for i in winningCombination{
            
            if state[ i[0] ] == state[ i[1] ] && state[ i[1] ] == state[ i[2] ] && state[ i[0] ]  != 2 {
                
                anounceWinner(player: state[ i[0] ] == 0 ? "0" : "x")
                break;
            }
        }
        
        if !state.contains(2){
            let alert = UIAlertController(title: "Draw", message: "play Again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: {
                
                [weak self] _ in
                
                self?.resetstate()
            }))
            DispatchQueue.main.async {
                self.present(alert,animated: true,completion: nil)
            }
        }
        
    }
    
    private func anounceWinner(player:String){
    
        let alert = UIAlertController(title: "Winner", message: "Winner is \(player)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: {
            
            [weak self] _ in
            
            self?.resetstate()
        }))
        DispatchQueue.main.async {
            self.present(alert,animated: true,completion: nil)
        }
    }
    
    
    private func resetstate(){
         state = [2,2,2,
                  2,2,2,
                  2,2,2]
        
        zeroFlag = false
        myCollectionView.reloadData()
    }
}
