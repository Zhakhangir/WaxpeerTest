//
//  HomeViewModel.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 08.04.2024.
//

import UIKit

enum LiveP2PState {
    case active
    case disactive
    
    var color: UIColor? {
        switch self {
        case .active:
            return R.color.wpGreen()
        case .disactive:
            return R.color.wpGray()
        }
    }
    
    var actionTitle: String {
        switch self {
        case .active:
            return R.string.loc.home_disactivateBtn()
        case .disactive:
            return R.string.loc.home_activateBtn()
        }
    }
    
    var actionColor: UIColor? {
        switch self {
        case .active:
            return R.color.wpGray()?.withAlphaComponent(0.5)
        case .disactive:
            return R.color.wpGreen()?.withAlphaComponent(0.5)
        }
    }
}
