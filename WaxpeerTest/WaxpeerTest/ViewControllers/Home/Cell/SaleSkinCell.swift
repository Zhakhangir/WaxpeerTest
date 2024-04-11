//
//  SaleSkinCell.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 07.04.2024.
//

import UIKit
import SDWebImage

class SaleSkinCell: UICollectionViewCell {
    private var skinInfoStackView = UIStackView()
    private var skinInfoLabelStackView = UIStackView()
    private var gameName = UILabel()
    private var itemId = UILabel()
    private var skinInfoProgressView = UIView()
    
    private var imageView = UIImageView()
    private var itemNameStackView = UIStackView()
    private var itemNameLabel = UILabel()
    private var marketNameLabel = UILabel()
    private var modelSeperatorView = UIView()
    
    private var priceContainerView = UIView()
    private var priceLabel = UILabel()
    private var steamIcon = UIImageView()
    private var steamPriceLabel = UILabel()
    private var discountLabel = PaddingLabel()
    
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
        gameName.textColor = R.color.wpGray()
        gameName.font = .systemFont(ofSize: 10, weight: .regular)
        gameName.text = "WW"
        
        itemId.textAlignment = .right
        itemId.textColor = .white
        itemId.font = .systemFont(ofSize: 10, weight: .regular)
        itemId.text = "0,456784"
        
        skinInfoLabelStackView.addArrangedSubview(gameName)
        skinInfoLabelStackView.addArrangedSubview(itemId)
        skinInfoLabelStackView.distribution = .fillEqually
        skinInfoLabelStackView.axis = .horizontal
        
        skinInfoProgressView.backgroundColor = R.color.wpGreen()
        
        skinInfoStackView.addArrangedSubview(skinInfoLabelStackView)
        skinInfoStackView.addArrangedSubview(skinInfoProgressView)
        skinInfoStackView.axis = .vertical
        skinInfoStackView.spacing = 4
        contentView.addSubview(skinInfoStackView)
        
        itemNameLabel.textColor = R.color.wpGray()
        itemNameLabel.numberOfLines = 2
        itemNameLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        marketNameLabel.numberOfLines = 2
        marketNameLabel.textColor = .white
        marketNameLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        
        modelSeperatorView.backgroundColor = R.color.wpGray()?.withAlphaComponent(0.7)
        
        itemNameStackView.addArrangedSubview(itemNameLabel)
        itemNameStackView.addArrangedSubview(marketNameLabel)
        itemNameStackView.addArrangedSubview(modelSeperatorView)
        itemNameStackView.axis = .vertical
        itemNameStackView.spacing = 8
        contentView.addSubview(itemNameStackView)
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = R.image.tomUIIX()
        contentView.addSubview(imageView)
        
        priceLabel.textColor = .white
        priceLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        priceContainerView.addSubview(priceLabel)
        
        steamIcon.contentMode = .scaleAspectFit
        steamIcon.image = R.image.steam()
        priceContainerView.addSubview(steamIcon)
        
        steamPriceLabel.textColor = R.color.wpGray()
        steamPriceLabel.font = .systemFont(ofSize: 12, weight: .regular)
        priceContainerView.addSubview(steamPriceLabel)
        
        priceContainerView.backgroundColor = .clear
        contentView.addSubview(priceContainerView)
        
        discountLabel.textColor = R.color.wpGreen()
        discountLabel.textAlignment = .center
        discountLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        discountLabel.layer.masksToBounds = true
        discountLabel.layer.cornerRadius = 8
        discountLabel.padding(4, 4, 8, 8)
        discountLabel.backgroundColor = R.color.wpGreen()?.withAlphaComponent(0.2)
        contentView.addSubview(discountLabel)
    }
    
    private func setConstraints() {
        var layoutContratints = [NSLayoutConstraint]()
        
        skinInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            skinInfoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            skinInfoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            skinInfoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ]
        
        skinInfoProgressView.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            skinInfoProgressView.heightAnchor.constraint(equalToConstant: 2)
        ]
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            imageView.topAnchor.constraint(equalTo: skinInfoStackView.bottomAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: AppConstants.shared.screenHeight/4)
        ]
        
        modelSeperatorView.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            modelSeperatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ]
        
        itemNameStackView.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            itemNameStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            itemNameStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            itemNameStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ]
        
        priceContainerView.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            priceContainerView.topAnchor.constraint(greaterThanOrEqualTo: itemNameStackView.bottomAnchor, constant: 8),
            priceContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceContainerView.trailingAnchor.constraint(lessThanOrEqualTo: discountLabel.leadingAnchor, constant: 4),
            priceContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ]
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            priceLabel.topAnchor.constraint(equalTo: priceContainerView.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceContainerView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: priceContainerView.trailingAnchor)
        ]
        
        steamIcon.translatesAutoresizingMaskIntoConstraints = false
        layoutContratints += [
            steamIcon.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            steamIcon.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            steamIcon.trailingAnchor.constraint(equalTo: steamPriceLabel.leadingAnchor, constant: -2),
            steamIcon.bottomAnchor.constraint(equalTo: priceContainerView.bottomAnchor),
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
            discountLabel.centerYAnchor.constraint(equalTo: priceContainerView.centerYAnchor),
            discountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(layoutContratints)
    }
    
    func configure(_ viewModel: SkinItemModel) {
        let discount = viewModel.discount
        gameName.text = viewModel.game
        itemId.text = viewModel.itemId?.valueAsString
        discountLabel.backgroundColor = discount.color?.withAlphaComponent(0.2)
        discountLabel.textColor = discount.color
        discountLabel.text = discount.value
        itemNameLabel.text = viewModel.name
        marketNameLabel.text = viewModel.marketName
        priceLabel.text = viewModel.currencyPrice
        steamPriceLabel.text = viewModel.currencySteamPrice
        
        if let imageURLString = viewModel.image {
            imageView.sd_setImage(with: imageURLString, placeholderImage: R.image.csgo())
        }
    }
}
