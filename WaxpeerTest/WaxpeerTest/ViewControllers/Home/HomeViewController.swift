//
//  HomeViewController.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 06.04.2024.
//

import UIKit

class HomeViewController: UIViewController {
    let mainView = HomeView()
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let activateCell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivateP2PCell.description(), for: indexPath) as? ActivateP2PCell,
            let scinCell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleSkinCell.description(), for: indexPath) as? SaleSkinCell
        else {
            return UICollectionViewCell()
        }
        
        if indexPath.row == 0 {
            return activateCell
        } else {
            
            return  scinCell
        }
        
        
    }
}
