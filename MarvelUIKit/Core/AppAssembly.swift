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
//        let navBar = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        
        tabBar.barTintColor = .red
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .white
//        navBar.barTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//        navBar.barStyle = .black
//        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    }
}
