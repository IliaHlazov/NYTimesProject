//
//  ViewControllerFactory.swift
//  Test!
//
//  Created by mac on 19.11.2022.
//

import Foundation
import UIKit

struct ViewControllerFactory {
    
    static func makeTabBarConrtoller() -> UITabBarController {
        
        let emailedViewController = MostEmailedViewController()
        let navCont = UINavigationController(rootViewController: emailedViewController)
        emailedViewController.title = "Most Emailed"
        emailedViewController.tabBarItem.image = UIImage(systemName: "book")
        
        let sharedViewController = MostSharedViewController()
        let navCont1 = UINavigationController(rootViewController: sharedViewController)
        sharedViewController.title = "Most Shared"
        sharedViewController.tabBarItem.image = UIImage(systemName: "book")
        
        let viewedViewController = MostViewedViewController()
        let navCont2 = UINavigationController(rootViewController: viewedViewController)
        viewedViewController.title = "Most Viewed"
        viewedViewController.tabBarItem.image = UIImage(systemName: "book")
        
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.title = "Favorites"
        favoritesViewController.tabBarItem.image = UIImage(systemName: "star.fill")
        
        let tabBarVc = UITabBarController()
        tabBarVc.setViewControllers([navCont, navCont1, navCont2, favoritesViewController], animated: false)
        tabBarVc.tabBar.barTintColor = .darkGray
        tabBarVc.tabBar.tintColor = .black
        tabBarVc.tabBar.backgroundColor = .darkGray
        return tabBarVc
    }
}
