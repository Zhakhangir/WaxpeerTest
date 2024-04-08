//
//  StartApplicationView.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 07.04.2024.
//

import UIKit

class StartApplicationView: UIView {
    let imageView = UIImageView()
    let precentLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setLayoutConstrints()
    }
    
    private func addSubviews() {
        imageView.contentMode = .scaleAspectFill
        imageView.image = R.image.wpBackground()
        addSubview(imageView)
        
        precentLabel.textColor = .white
        precentLabel.textAlignment = .center
        precentLabel.font = .systemFont(ofSize: 40, weight: .black)
        addSubview(precentLabel)
    }
    
    private func setLayoutConstrints() {
        var layoutConstraints = [NSLayoutConstraint]()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        precentLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            precentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            precentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            precentLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -32)
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
