//
//  AppDelegate.swift
//  photo app
//
//  Created by t h a . m a m e rozz on 27.06.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .systemBackground.withAlphaComponent(0.5)
        
        let firstViewController = FirstViewController()
        firstViewController.tabBarItem = UITabBarItem(title: "Медиатека", image: .init(systemName: "photo.fill.on.rectangle.fill"), tag: 0)
        
        let mainViewController = MainViewController()
        mainViewController.tabBarItem = UITabBarItem(title: "Для Вас", image: .init(systemName: "heart.text.square.fill"), tag: 1)
        
        let thirdViewController = ThirdViewController()
        thirdViewController.tabBarItem = UITabBarItem(title: "Альбомы", image: .init(systemName: "rectangle.stack.fill"), tag: 2)
        
        let fourthViewController = FourthViewController()
        fourthViewController.tabBarItem = UITabBarItem(title: "Поиск", image: .init(systemName: "magnifyingglass"), tag: 3)
        
        tabBarController.setViewControllers([
            firstViewController,
            mainViewController,
            thirdViewController,
            fourthViewController
        ], animated: true)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

