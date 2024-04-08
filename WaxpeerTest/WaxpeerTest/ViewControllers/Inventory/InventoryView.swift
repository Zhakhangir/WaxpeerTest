//
//  InventoryView.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 07.04.2024.
//

import UIKit

class InventoryView: UIView {
    let imageView = UIImageView()
    let descriptionLabel = UILabel()
    
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
        imageView.contentMode = .scaleAspectFit
        imageView.image = R.image.tomUIIX()
        addSubview(imageView)
        
        descriptionLabel.font = .systemFont(ofSize: 24, weight: .bold)
        descriptionLabel.text = "I need UI/UX designer"
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .white
        addSubview(descriptionLabel)
    }
    
    private func setConstrints() {
        var layoutContraints = [NSLayoutConstraint]()
     
        imageView.translatesAutoresizingMaskIntoConstraints = false
        layoutContraints += [
            imageView.heightAnchor.constraint(equalToConstant: AppConstants.shared.screenHeight/2),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        ]
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutContraints += [
            descriptionLabel.topAnchor.constraint(lessThanOrEqualTo: imageView.bottomAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            descriptionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(layoutContraints)
    }
}
