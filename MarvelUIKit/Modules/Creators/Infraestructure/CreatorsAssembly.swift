// CreatorsAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class CreatorsAssembly {
    
    static func navigationController() -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController())
        return navigationController
    }
    
    static func viewController() -> CreatorsViewController {
        let vc = CreatorsViewController(nibName: CreatorsViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc)
        return vc
    }
    
    static func presenter(viewController: CreatorsViewController) -> CreatorsPresenterProtocol {
        let presenter = CreatorsPresenterImpl(viewController: viewController)
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.interactor = interactor()
        return presenter
    }
    
    static func interactor() -> CreatorsInteractorProtocol {
        let interactor = CreatorsInteractorImpl()
        return interactor
    }
    
    static func router(viewController: CreatorsViewController, presenter: CreatorsPresenterProtocol) -> CreatorsRouterProtocol {
        let router = CreatorsRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

