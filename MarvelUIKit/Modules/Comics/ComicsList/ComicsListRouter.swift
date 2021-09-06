// ComicsListRouterImpl.swift
// Architecture VIPER
//


import Foundation

protocol ComicsListRouterProtocol {
    func showDetailComic(data: Comic)
}

class ComicsListRouterImpl: BaseRouter< ComicsListPresenterProtocol> {
    
    
}

extension ComicsListRouterImpl: ComicsListRouterProtocol {
    func showDetailComic(data: Comic) {
        let vc = ComicsDetailsAssembly.viewController(data: data)
        self.present(vc, animated: true)
    }    
}
