// CharactersListPresenter.swift
// Architecture VIPER
//

import Foundation

protocol CharactersListPresenterProtocol {
    func fetchData()
    func getNumberOfRowInSections() -> Int
    func getInformationObject(indexPath: Int) -> Character?
    func showDetailCharacter(data: Character)
}

class CharactersListPresenterImpl: BasePresenter<CharactersListViewControllerProtocol, CharactersListRouterProtocol, CharactersListInteractorProtocol> {
    
    var data: [Character] = []
    var finalList = false
    var offset = 0
    var total = 0
}


extension CharactersListPresenterImpl: CharactersListPresenterProtocol {
    func showDetailCharacter(data: Character) {
        self.router?.showDetailCharacter(data: data)
    }
    
    func fetchData(){
        if !self.finalList{
            self.interactor?.fetchDataInteractor(offset: self.offset, success: { [weak self] resultArray in
                guard self != nil else { return }
                if let resultArraydDes = resultArray?.results{
                    self?.data.append(contentsOf: resultArraydDes.map{Character(businessModel: $0)})
                    self?.offset += (resultArray?.limit)!
                    self?.viewController?.reloadData()
                    if self?.data.count == self?.total{
                        self?.finalList = true
                    }
                }
            }, failure: { (error) in
                print(error?.localizedDescription ?? "Error")
            })
        }
    }
    
    func getNumberOfRowInSections() -> Int{
        self.data.count
    }
    
    func getInformationObject(indexPath: Int) -> Character? {
        self.data[indexPath]
    }
}
