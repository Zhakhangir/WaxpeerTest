//
//  UINavigationControllerExtensio.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 07.04.2024.
//

import UIKit

extension UINavigationController {
    
    func setNavigationTitle(_ title: String, animated: Bool = true) {
        guard animated else {
            self.visibleViewController?.title = title
            return
        }
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        self.navigationBar.layer.add(transition, forKey: kCATransition)
        self.visibleViewController?.title = title
    }
}
