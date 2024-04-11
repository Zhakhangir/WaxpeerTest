//
//  ActivateP2PCell.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 07.04.2024.
//

import UIKit
import Combine

enum LiveP2PState {
    case subscribed
    case unsubsribed
    case error
    
    var color: UIColor? {
        switch self {
        case .subscribed:
            return R.color.wpGreen()
        case .unsubsribed:
            return R.color.wpGray()
        case .error:
            return R.color.wpRed()
        }
    }
    
    var actionTitle: String {
        switch self {
        case .subscribed:
            return R.string.loc.home_disactivateBtn()
        case .unsubsribed:
            return R.string.loc.home_activateBtn()
        case .error:
            return R.string.loc.home_retryBtn()
        }
    }
    
    var actionColor: UIColor? {
        switch self {
        case .subscribed, .error:
            return R.color.wpGray()
        case .unsubsribed:
            return  R.color.wpGreen()
        }
    }
}


class ActivateP2PCell: UICollectionViewCell {
    private let stateImageView = UIImageView()
    var subscribers = Set<AnyCancellable>()
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        subscribers = Set<AnyCancellable>()
    }
    
    func configure(_ state: LiveP2PState) {
        stateImageView.tintColor = state.color
        actionButton.setTitle(state.actionTitle, for: .normal)
        actionButton.backgroundColor = state.actionColor
    }
    
    private func addSubviews() {
        let stateImage = R.image.powerSocket()?.withRenderingMode(.alwaysTemplate)
        stateImageView.image = stateImage
        stateImageView.contentMode = .scaleAspectFit
        contentView.addSubview(stateImageView)
        
        actionButton.layer.cornerRadius = 8
        actionButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
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
