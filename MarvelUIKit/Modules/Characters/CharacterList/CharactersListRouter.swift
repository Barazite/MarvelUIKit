// CharactersListRouterImpl.swift
// Architecture VIPER
//


import Foundation

protocol CharactersListRouterProtocol {
    func showDetailCharacter(data: Character)
}

class CharactersListRouterImpl: BaseRouter< CharactersListPresenterProtocol> {
    
    
}

extension CharactersListRouterImpl: CharactersListRouterProtocol {
    func showDetailCharacter(data: Character) {
        let vc = CharactersDetailsAssembly.viewController(data: data)
        self.show(vc)
    }
}
