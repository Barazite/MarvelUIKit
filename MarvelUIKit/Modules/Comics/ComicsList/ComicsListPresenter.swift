// ComicsListPresenter.swift
// Architecture VIPER
//

import Foundation

protocol ComicsListPresenterProtocol {
    func fetchData()
    func showDetailComic(data: Comic)
    func getNumberOfRowInSections() -> Int
    func getInformationObject(indexPath: Int) -> Comic?
}

class ComicsListPresenterImpl: BasePresenter<ComicsListViewControllerProtocol, ComicsListRouterProtocol, ComicsListInteractorProtocol> {
    
    var data: [Comic] = []
    var finalList = false
    var offset = 0
    var total = 0
}


extension ComicsListPresenterImpl: ComicsListPresenterProtocol {
    func fetchData(){
        if !self.finalList{
            self.interactor?.fetchDataInteractor(offset: self.offset, success: { [weak self] resultArray in
                guard self != nil else { return }
                if let resultArraydDes = resultArray?.results{
                    self?.data.append(contentsOf: resultArraydDes.map{Comic(businessModel: $0)})
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
    
    func showDetailComic(data: Comic){
        self.router?.showDetailComic(data: data)
    }
    
    func getNumberOfRowInSections() -> Int{
        self.data.count
    }
    
    func getInformationObject(indexPath: Int) -> Comic?{
        self.data[indexPath]
    }
}
