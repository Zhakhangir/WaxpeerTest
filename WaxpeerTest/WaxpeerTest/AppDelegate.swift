//
//  AppDelegate.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 06.04.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = R.color.wpLightBlack()
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = StartApplicationViewController()
        window?.makeKeyAndVisible()
        
        customizeAppearance()
        
        return true
    }
    
    func customizeAppearance() {
        let customNavBarAppearance = UINavigationBarAppearance()
        customNavBarAppearance.configureWithOpaqueBackground()
        customNavBarAppearance.backgroundColor = R.color.wpLightBlack()
        customNavBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        customNavBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    
        UINavigationBar.appearance().scrollEdgeAppearance = customNavBarAppearance
        UINavigationBar.appearance().compactAppearance = customNavBarAppearance
        UINavigationBar.appearance().standardAppearance = customNavBarAppearance
        if #available(iOS 15.0, *) {
            UINavigationBar.appearance().compactScrollEdgeAppearance = customNavBarAppearance
        }
        
        let customTabBarAppearance = UITabBarAppearance()
        customTabBarAppearance.configureWithOpaqueBackground()
        customTabBarAppearance.backgroundColor = R.color.wpLightBlack()
        customTabBarAppearance.selectionIndicatorTintColor = .white
        
        UITabBar.appearance().scrollEdgeAppearance = customTabBarAppearance
        UITabBar.appearance().standardAppearance = customTabBarAppearance
    }
}

