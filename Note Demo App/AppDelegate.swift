//
//  AppDelegate.swift
//  Note Demo App
//
//  Created by thorn on 18/2/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        var mainViewController: Any
        
        
        let userDefault = UserDefaults.standard
        let isAuthenticated = userDefault.string(forKey: USER_ID_KEY)
        
        if isAuthenticated != nil && isAuthenticated != "" {
            mainViewController = tabbarView()
        } else {
            mainViewController = LoginViewController()
        }
        
        let navController = UINavigationController(
            rootViewController: mainViewController as! UIViewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    // tabbar view
    func tabbarView() -> UITabBarController {
        
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.tabBarItem = UITabBarItem(
            title: "Home", image: UIImage(systemName: "house"), tag: 0
        )
        
        let profileViewController = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem = UITabBarItem(
            title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 1
        )
        
        let settingsViewController  = SettingsViewController()
        let settingsNavigationController = UINavigationController(rootViewController: settingsViewController)
        settingsNavigationController.tabBarItem = UITabBarItem(
            title: "Settings", image: UIImage(systemName: "gear"), tag: 2
        )
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            homeNavigationController,
            profileNavigationController,
            settingsNavigationController
        ]
        
        return tabBarController
    }
    
    // static get tabbarView
    static func getTabbarView() -> UITabBarController {
        return (UIApplication.shared.delegate as! AppDelegate).tabbarView()
    }
    
    static func animateTabBar() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = getTabbarView()
        UIView.transition(
            with: appDelegate.window!,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: nil,
            completion: nil
        )
    }
    
}

