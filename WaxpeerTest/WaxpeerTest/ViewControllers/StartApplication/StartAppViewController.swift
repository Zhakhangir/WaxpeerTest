//
//  Start.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 06.04.2024.
//

import UIKit

class StartApplicationViewController: UIViewController {
    let mainView = StartApplicationView()
    

    override func loadView() {
        super.loadView()
        
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        animateNumbers(duration: 0.7)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setTabBarAsRoot()
    }
    
    
    private func animateNumbers(duration: TimeInterval) {
        let totalSteps = 100
        let totalTime = duration
        let timeInterval = totalTime / Double(totalSteps)
        
        var counter = 0
        Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
            if counter == totalSteps {
                timer.invalidate()
            } else {
                counter += 1
                self.mainView.precentLabel.text = counter.description + "%"
            }
        }
    }
    
    
    private func setTabBarAsRoot() {
        let tabBar = TabBarConrtoller()
        guard let window = view.window else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromLeft, animations: {
                window.rootViewController = tabBar
            }, completion: nil)
        }
    }
}
