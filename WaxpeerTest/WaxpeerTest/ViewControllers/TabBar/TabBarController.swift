//
//  TabBarController.swift
//  WaxpeerTest
//
//  Created by Zhakhangir on 06.04.2024.
//

import UIKit

enum TabControllers: Int, CaseIterable {
    case home
    case inventory
    case sales
    case delivery
    case profile
    
    var title: String {
        switch self {
        case .home:
            return R.string.loc.home_title()
        case .inventory:
            return R.string.loc.inventory_title()
        case .sales:
            return R.string.loc.sales_title()
        case .delivery:
            return R.string.loc.delivery_title()
        case .profile:
            return R.string.loc.profile_title()
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .home:
            return R.image.home()
        case .inventory:
            return R.image.inventory()
        case .sales:
            return R.image.sales()
        case .delivery:
            return R.image.delivery()
        case .profile:
            return R.image.profile()
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .inventory:
            return InventoryViewController()
        case .sales:
            return SalesViewController()
        case .delivery:
            return  DeliveryViewController()
        case .profile:
            return ProfileViewController()
        }
    }
}

class TabBarConrtoller: UITabBarController, UITabBarControllerDelegate  {
    private let controllers = TabControllers.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        view.backgroundColor = R.color.wpBlack()
        viewControllers = controllers.map({ makeController($0) })
    }
    
    
    private func makeController(_ controller: TabControllers) -> UIViewController {
        let vc = controller.viewController
        let item = UITabBarItem(title: controller.title, image: controller.icon, tag: controller.rawValue)
        let navigation = UINavigationController(rootViewController: vc)
        vc.title = controller.title
        vc.tabBarItem = item
        return navigation
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let fromNavigationController = selectedViewController as? UINavigationController,
              let fromView = fromNavigationController.topViewController?.view,
              let toNavigationController = viewController as? UINavigationController,
              let toView = toNavigationController.topViewController?.view else {
            return false
        }

        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        }
        
        return true
    }
}
