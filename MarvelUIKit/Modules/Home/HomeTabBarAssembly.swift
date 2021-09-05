//
//  HomeTabBarAssembly.swift
//  MarvelUIKit
//
//  Created by Adrian Sevilla Diaz on 31/8/21.
//

import Foundation
import UIKit

final public class HomeTabBarAssembly {
    
    static func homeTabBarController() -> HomeTabBarController {
        let viewController = HomeTabBarController(nibName: HomeTabBarController.defaultReuseIdentifierViewController, bundle: nil)
        
        let CharactersViewController = CharactersListAssembly.navigationController()
        let ComicsViewController = ComicsListAssembly.navigationController()
        let CreatorsViewController = CreatorsAssembly.navigationController()
        
        let CharactersCustomTabBarItem = UITabBarItem(title: "Heros", image: UIImage(named: "hero"), selectedImage: UIImage(named: "hero"))
        let ComicsCustomTabBarItem = UITabBarItem(title: "Comics", image: UIImage(named: "comic"), selectedImage: UIImage(named: "comic"))
        let CreatorsCustomTabBarItem = UITabBarItem(title: "Creators", image: UIImage(named: "creator"), selectedImage: UIImage(named: "creator"))

        CharactersViewController.tabBarItem = CharactersCustomTabBarItem
        ComicsViewController.tabBarItem = ComicsCustomTabBarItem
        CreatorsViewController.tabBarItem = CreatorsCustomTabBarItem
        
        viewController.viewControllers = [CharactersViewController, ComicsViewController, CreatorsViewController]
                
        return viewController
    }
}
