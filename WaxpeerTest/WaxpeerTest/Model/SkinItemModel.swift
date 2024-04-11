//
//  AddItemModel.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 10.04.2024.
//

import UIKit

enum ItemIdentifier: Codable {
    case int(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        if let intValue = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(intValue)
        } else if let stringValue = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(stringValue)
        } else {
            throw AppError.decode(description: R.string.loc.gen_errorItemId())
        }
    }
    
    
    var valueAsString: String? {
        switch self {
        case .int(let int):
            return int.description
        case .string(let string):
            return string
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .int(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}

enum PriceDiscount {
    case hasDisount(value: String)
    case noDiscount(value: String)
    
    var value: String  {
        switch self {
        case .hasDisount(let value):
            return "-" + value + "%"
        case .noDiscount(let value):
            return "+" + value + "%"
        }
    }
    
    var color: UIColor? {
        switch self {
        case .hasDisount:
            return R.color.wpGreen()
        case .noDiscount:
            return R.color.wpRed()
        }
    }
}

struct SkinItemModel: Codable {
    var available: Bool?
    var average: Int?
    var game: String?
    var image: URL?
    var itemId: ItemIdentifier?
    var marketName: String?
    var name: String?
    var price: Float?
    var searchName: String?
    var steamPrice: Float?
    
    private enum CodingKeys: String, CodingKey {
        case available, average, game, image, price, name
        case itemId = "item_id"
        case marketName = "market_name"
        case searchName = "search_name"
        case steamPrice = "steam_price"
    }
    
    var discount: PriceDiscount {
        let _price = price ?? 0.0
        let _steamPrice = steamPrice ?? 0.0
        let value =  _price < _steamPrice ? String(format: "%.1f", ((_steamPrice - _price)/_steamPrice) * 100) :  String(format: "%.1f", ((_price - _steamPrice)/_price) * 100)
        return _price <= _steamPrice ? .hasDisount(value: value) : .noDiscount(value: value)
    }
    
    var currencyPrice: String {
        return "$ " + String(format: "%.2f", price ?? 0.0)
    }
    
    var currencySteamPrice: String {
        return "$ " + String(format: "%.2f", steamPrice ?? 0.0)
    }
}
