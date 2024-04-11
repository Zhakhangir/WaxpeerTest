//
//  Error.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 10.04.2024.
//

import Foundation

enum AppError: Error {
    case socketConnect
    case decode(description: String)
    case custom(description: String)
}
