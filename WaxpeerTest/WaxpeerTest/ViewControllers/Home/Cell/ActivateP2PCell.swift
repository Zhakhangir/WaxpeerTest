//
//  ActivateP2PCell.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 07.04.2024.
//

import UIKit

class ActivateP2PCell: UICollectionViewCell {
    let state = LiveP2PState.disactive
    let stateImageView = UIImageView()
    let actionButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = R.color.wpLightBlack()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        let stateImage = R.image.powerSocket()?.withRenderingMode(.alwaysTemplate)
        stateImageView.image = stateImage
        stateImageView.tintColor = state.color
        stateImageView.contentMode = .scaleAspectFit
        contentView.addSubview(stateImageView)
        
        actionButton.setTitle(state.actionTitle, for: .normal)
        actionButton.backgroundColor = state.actionColor
        actionButton.layer.cornerRadius = 8
        actionButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        actionButton.titleLabel?.textColor = .white
        contentView.addSubview(actionButton)
    }
    
    private func setConstraints() {
        var layoutContratints = [NSLayoutConstraint]()
        
        stateImageView.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            stateImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stateImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            stateImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            stateImageView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -16)
        ]
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            actionButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            actionButton.heightAnchor.constraint(equalToConstant: 52)
        ]
       
        NSLayoutConstraint.activate(layoutContratints)
    }
}
