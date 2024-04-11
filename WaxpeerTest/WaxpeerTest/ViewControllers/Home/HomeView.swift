//
//  DelivaryView.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 07.04.2024.
//

import UIKit

class HomeView: UIView {
    var collectionView: UICollectionView!
    let statusLabel = PaddingLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = R.color.wpBlack()
        
        addSubviews()
        setConstrints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        
        statusLabel.padding(4, 4, 4, 4)
        statusLabel.font = .systemFont(ofSize: 16, weight: .regular)
        statusLabel.textAlignment = .center
        statusLabel.backgroundColor = R.color.wpGreen()
        addSubview(statusLabel)
        
        let layout = TwoColumnFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SaleSkinCell.self, forCellWithReuseIdentifier: SaleSkinCell.description())
        collectionView.register(ActivateP2PCell.self, forCellWithReuseIdentifier: ActivateP2PCell.description())
        collectionView.backgroundColor = R.color.wpBlack()
        addSubview(collectionView)
    }
    
    private func setConstrints() {
        var layoutContraints = [NSLayoutConstraint]()
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutContraints += [
            statusLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layoutContraints += [
            collectionView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(layoutContraints)
    }
}
