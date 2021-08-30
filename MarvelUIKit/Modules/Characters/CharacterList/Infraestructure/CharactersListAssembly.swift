// CharactersListAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class CharactersListAssembly {
    
    static func navigationController() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController())
        return navigationController
    }
    
    static func viewController() -> CharactersListViewController {
        let vc = CharactersListViewController(nibName: CharactersListViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc)
        return vc
    }
    
    static func presenter(viewController: CharactersListViewController) -> CharactersListPresenterProtocol {
        let presenter = CharactersListPresenterImpl(viewController: viewController)
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.interactor = interactor()
        return presenter
    }
    
    static func interactor() -> CharactersListInteractorProtocol {
        let interactor = CharactersListInteractorImpl()
        return interactor
    }
    
    static func router(viewController: CharactersListViewController, presenter: CharactersListPresenterProtocol) -> CharactersListRouterProtocol {
        let router = CharactersListRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

