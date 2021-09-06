// ComicsDetailsPresenter.swift
// Architecture VIPER
//

import Foundation

protocol ComicsDetailsPresenterProtocol {
    func getInformationObject() -> Comic
}

class ComicsDetailsPresenterImpl: BasePresenter<ComicsDetailsViewControllerProtocol, ComicsDetailsRouterProtocol, ComicsDetailsInteractorProtocol> {
    
    var comic: Comic?
    
}


extension ComicsDetailsPresenterImpl: ComicsDetailsPresenterProtocol {
    
    func getInformationObject() -> Comic {
        self.comic!
    }
  
}
