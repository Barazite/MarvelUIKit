//
//  AppAssembly.swift
//  MarvelUIKit
//
//  Created by Adrian Sevilla Diaz on 23/8/21.
//

import Foundation
import UIKit

protocol AppAssemblyProtocol{
    func setPrincipalViewController(in window: UIWindow)
}

class AppAssembly: AppAssemblyProtocol{
    
    var actualViewController: UIViewController!
    
    internal func setPrincipalViewController(in window: UIWindow){
        self.customUI()
        actualViewController = HomeTabBarAssembly.homeTabBarController()
        window.rootViewController = actualViewController
        window.makeKeyAndVisible()
    }
        
    fileprivate func customUI(){
        let navBar = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        
        tabBar.barTintColor = .red
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .white
        
        navBar.barTintColor = .red
        navBar.tintColor = .black
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(.red)]
    }
}
