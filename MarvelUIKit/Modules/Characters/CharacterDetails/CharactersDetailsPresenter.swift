// CharactersDetailsPresenter.swift
// Architecture VIPER
//

import Foundation

protocol CharactersDetailsPresenterProtocol {
    func getInformationObject() -> Character
}

class CharactersDetailsPresenterImpl: BasePresenter<CharactersDetailsViewControllerProtocol, CharactersDetailsRouterProtocol, CharactersDetailsInteractorProtocol> {
    
    var character: Character?
    
}


extension CharactersDetailsPresenterImpl: CharactersDetailsPresenterProtocol {
    func getInformationObject() -> Character {
        self.character!
    }
}
