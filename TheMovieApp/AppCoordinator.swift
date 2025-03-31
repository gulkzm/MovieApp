//
//  AppCoordinator.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 18.03.25.
//
import UIKit
import Foundation

final class AppCoordinator: Coordinator {
    var window: UIWindow?
    var navigationController: UINavigationController
    
    init(window: UIWindow?, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        if UserDefaults.standard.string(forKey: "userId") == nil {

            loginRoot()
        } else {
            tabbarRoot()
        }
    }
    
    func loginRoot() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AuthController") as! AuthController
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
    func tabbarRoot() {
        let tabbarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbar")
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
    }
}
