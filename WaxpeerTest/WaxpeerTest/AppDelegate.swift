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
        configureConstants()
        
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
       
        let customTabBarAppearance = UITabBarAppearance()
        customTabBarAppearance.configureWithOpaqueBackground()
        customTabBarAppearance.backgroundColor = R.color.wpLightBlack()
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().standardAppearance = customTabBarAppearance
        
        if #available(iOS 15.0, *) {
            UINavigationBar.appearance().compactScrollEdgeAppearance = customNavBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = customTabBarAppearance
        }
    }
    
    func configureConstants() {
        let authorizationHeader = "f98a61b368447706734d7bb4d04552dbdbe443f04715378370515ed27337e2a2"
        let cookieHeader = "_redis=s%3AlSOM3XKAJ_sJHXWvHHbO6VPlsVq8CC6P.fC%2BfjdLiTQLRaSRH%2BDyI7L4dGkfVwfmiTDM4vUN7Tqo"

        KeychainService.shared.save(value: authorizationHeader, key: "Authorization")
        KeychainService.shared.save(value: cookieHeader, key: "Cookie")
    }
}

