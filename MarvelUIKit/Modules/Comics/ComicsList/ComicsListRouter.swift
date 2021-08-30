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
        
    }    
}
