//
//  AppConstants.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 07.04.2024.
//

import UIKit

class AppConstants {
    static let shared = AppConstants()
    
    private init() { }
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    let socketURL = URL(string: "wss://waxpeer.com/socket.io")
}
