//
//  HomeViewController.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 06.04.2024.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    let viewModel: HomeViewModel
    private let mainView = HomeView()
    private var subscribers = Set<AnyCancellable>()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        setSubscribers()
    }
    
    private func setSubscribers() {
        viewModel.dataSource.sink { [weak self] dataSource in
            print(dataSource.count)
            self?.mainView.collectionView.reloadData()
        }.store(in: &subscribers)
        
        viewModel.$addItemLive.sink { [weak self] _ in
            self?.mainView.collectionView.reloadData()
        }.store(in: &subscribers)
        
        viewModel.$eventStatus.sink { [weak self] status in
            self?.mainView.statusLabel.text = "Socket: \(status.event) \(status.message)"
            self?.mainView.statusLabel.backgroundColor = status.event.statusColor
        }.store(in: &subscribers)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, URLSessionDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModel.currentDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let activateCell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivateP2PCell.description(), for: indexPath) as? ActivateP2PCell,
            let scinCell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleSkinCell.description(), for: indexPath) as? SaleSkinCell
        else {
            return UICollectionViewCell()
        }
        
        let data = viewModel.currentDataSource[indexPath.row]
        
        switch data {
        case .activate:
            activateCell.actionButton.publisher(for: .touchUpInside).sink { [weak self] _ in
                guard let self else { return }
                viewModel.toggleP2PState()
            }.store(in: &activateCell.subscribers)
            
            activateCell.configure(viewModel.addItemLive)
            return activateCell
        case .skin(var viewModel):
            scinCell.configure(viewModel)
            return scinCell
        }
    }
}
