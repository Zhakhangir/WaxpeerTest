//
//  TwoCllumnsFlowLayout.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 08.04.2024.
//

import UIKit

class TwoColumnFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        let availableWidth = collectionView.bounds.width - sectionInset.left - sectionInset.right - minimumInteritemSpacing
        let itemWidth = (availableWidth / 2).rounded(.down)
    
        itemSize = CGSize(width: itemWidth, height: 400)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
