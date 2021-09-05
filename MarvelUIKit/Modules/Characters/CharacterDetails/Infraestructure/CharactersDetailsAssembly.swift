// CharactersDetailsAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class CharactersDetailsAssembly {
        
    static func viewController(data: Character) -> CharactersDetailsViewController {
        let vc = CharactersDetailsViewController(nibName: CharactersDetailsViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc, data: data)
        return vc
    }
    
    static func presenter(viewController: CharactersDetailsViewController, data: Character) -> CharactersDetailsPresenterProtocol {
        let presenter = CharactersDetailsPresenterImpl(viewController: viewController)
        presenter.character = data
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.interactor = interactor()
        return presenter
    }
    
    static func interactor() -> CharactersDetailsInteractorProtocol {
        let interactor = CharactersDetailsInteractorImpl()
        return interactor
    }
    
    static func router(viewController: CharactersDetailsViewController, presenter: CharactersDetailsPresenterProtocol) -> CharactersDetailsRouterProtocol {
        let router = CharactersDetailsRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

