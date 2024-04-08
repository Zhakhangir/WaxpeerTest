//
//  SaleSkinCell.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 07.04.2024.
//

import UIKit

class SaleSkinCell: UICollectionViewCell {
    let rareStackView = UIStackView()
    let rareLabelStackView = UIStackView()
    let rareCategoryLabel = UILabel()
    let rareValueLabel = UILabel()
    let rareProgressView = UIView()
    
    let modelStackView = UIStackView()
    let imageView = UIImageView()
    let modelLabel = UILabel()
    let modelNameLabel = UILabel()
    let modelSeperatorView = UIView()

    let priceLabel = UILabel()
    let steamIcon = UIImageView()
    let steamPriceLabel = UILabel()
    let discountLabel = PaddingLabel()
   
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
        rareCategoryLabel.textColor = R.color.wpGray()
        rareCategoryLabel.font = .systemFont(ofSize: 10, weight: .regular)
        rareCategoryLabel.text = "WW"
        
        rareValueLabel.textAlignment = .right
        rareValueLabel.textColor = .white
        rareValueLabel.font = .systemFont(ofSize: 10, weight: .regular)
        rareValueLabel.text = "0,456784"
        
        rareLabelStackView.addArrangedSubview(rareCategoryLabel)
        rareLabelStackView.addArrangedSubview(rareValueLabel)
        rareLabelStackView.distribution = .fillEqually
        rareLabelStackView.axis = .horizontal
        
        rareProgressView.backgroundColor = R.color.wpGreen()
       
        rareStackView.addArrangedSubview(rareLabelStackView)
        rareStackView.addArrangedSubview(rareProgressView)
        rareStackView.axis = .vertical
        rareStackView.spacing = 4
        contentView.addSubview(rareStackView)
        
        modelLabel.textColor = R.color.wpGray()
        modelLabel.font = .systemFont(ofSize: 12, weight: .regular)
        modelLabel.text = "M4SW-A"
        
        modelNameLabel.textColor = .white
        modelNameLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        modelNameLabel.text = "Imminent Danger"
        
        modelSeperatorView.backgroundColor = R.color.wpGray()?.withAlphaComponent(0.7)
        
        modelStackView.addArrangedSubview(modelLabel)
        modelStackView.addArrangedSubview(modelNameLabel)
        modelStackView.addArrangedSubview(modelSeperatorView)
        modelStackView.axis = .vertical
        modelStackView.spacing = 4
        contentView.addSubview(modelStackView)
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = R.image.tomUIIX()
        contentView.addSubview(imageView)
        
        priceLabel.textColor = .white
        priceLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        priceLabel.text = "$ 1 287.93"
        contentView.addSubview(priceLabel)
    
        steamIcon.contentMode = .scaleAspectFit
        steamIcon.image = R.image.steam()
        contentView.addSubview(steamIcon)
        
        steamPriceLabel.textColor = R.color.wpGray()
        steamPriceLabel.font = .systemFont(ofSize: 12, weight: .regular)
        steamPriceLabel.text = "$ 8 287.93"
        contentView.addSubview(steamPriceLabel)
        
        discountLabel.textColor = R.color.wpGreen()
        discountLabel.textAlignment = .center
        discountLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        discountLabel.layer.masksToBounds = true
        discountLabel.layer.cornerRadius = 8
        discountLabel.text = "-76%"
        discountLabel.padding(4, 4, 8, 8)
        discountLabel.backgroundColor = R.color.wpGreen()?.withAlphaComponent(0.2)
        contentView.addSubview(discountLabel)
    }
    
    private func setConstraints() {
        var layoutContratints = [NSLayoutConstraint]()
        
        rareStackView.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            rareStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            rareStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            rareStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ]
        
        rareProgressView.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            rareProgressView.heightAnchor.constraint(equalToConstant: 2)
        ]
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            imageView.topAnchor.constraint(equalTo: rareStackView.bottomAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: AppConstants.shared.screenHeight/4)
        ]
        
        modelSeperatorView.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            modelSeperatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ]
        
        modelStackView.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            modelStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            modelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            modelStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ]

        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            priceLabel.topAnchor.constraint(equalTo: modelStackView.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(lessThanOrEqualTo: discountLabel.leadingAnchor, constant: 4)
        ]
        
        steamIcon.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            steamIcon.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            steamIcon.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            steamIcon.trailingAnchor.constraint(equalTo: steamPriceLabel.leadingAnchor, constant: -2),
            steamIcon.heightAnchor.constraint(equalToConstant: 16),
            steamIcon.widthAnchor.constraint(equalToConstant: 16)
        ]
        
        steamPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            steamPriceLabel.centerYAnchor.constraint(equalTo: steamIcon.centerYAnchor),
            steamPriceLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor)
        ]
        
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            discountLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            discountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(layoutContratints)
    }
}
