// ComicsDetailsAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class ComicsDetailsAssembly {
        
    static func viewController(data: Comic) -> ComicsDetailsViewController {
        let vc = ComicsDetailsViewController(nibName: ComicsDetailsViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc, data: data)
        return vc
    }
    
    static func presenter(viewController: ComicsDetailsViewController, data: Comic) -> ComicsDetailsPresenterProtocol {
        let presenter = ComicsDetailsPresenterImpl(viewController: viewController)
        presenter.comic = data
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.interactor = interactor()
        return presenter
    }
    
    static func interactor() -> ComicsDetailsInteractorProtocol {
        let interactor = ComicsDetailsInteractorImpl()
        return interactor
    }
    
    static func router(viewController: ComicsDetailsViewController, presenter: ComicsDetailsPresenterProtocol) -> ComicsDetailsRouterProtocol {
        let router = ComicsDetailsRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

