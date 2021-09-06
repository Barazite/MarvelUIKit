// ComicsListAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class ComicsListAssembly {
    
    static func navigationController() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController())
        return navigationController
    }
    
    static func viewController() -> ComicsListViewController {
        let vc = ComicsListViewController(nibName: ComicsListViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc)
        return vc
    }
    
    static func presenter(viewController: ComicsListViewController) -> ComicsListPresenterProtocol {
        let presenter = ComicsListPresenterImpl(viewController: viewController)
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.interactor = interactor()
        return presenter
    }
    
    static func interactor() -> ComicsListInteractorProtocol {
        let interactor = ComicsListInteractorImpl()
        return interactor
    }
    
    static func router(viewController: ComicsListViewController, presenter: ComicsListPresenterProtocol) -> ComicsListRouterProtocol {
        let router = ComicsListRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

