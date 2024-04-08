//
//  InventoryViewController.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 06.04.2024.
//

import UIKit

class InventoryViewController: UIViewController {
    let mainView = InventoryView()
    
    override func loadView() {
        super.loadView()
            
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
