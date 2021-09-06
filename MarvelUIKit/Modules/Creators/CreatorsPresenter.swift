// CreatorsPresenter.swift
// Architecture VIPER
//

import Foundation

protocol CreatorsPresenterProtocol {
   func fetchData()
    func getNumberOfRowInSections() -> Int
    func getInformationObject(indexPath: Int) -> Creator?
}

class CreatorsPresenterImpl: BasePresenter<CreatorsViewControllerProtocol, CreatorsRouterProtocol, CreatorsInteractorProtocol> {
    
    var data: [Creator] = []
    var finalList = false
    var offset = 0
    var total = 0
}


extension CreatorsPresenterImpl: CreatorsPresenterProtocol {
    func fetchData(){
        if !self.finalList{
            self.interactor?.fetchDataInteractor(offset: self.offset, success: { [weak self] resultArray in
                guard self != nil else { return }
                if let resultArraydDes = resultArray?.results{
                    self?.data.append(contentsOf: resultArraydDes.map{Creator(businessModel: $0)})
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
    
    func getInformationObject(indexPath: Int) -> Creator?{
        self.data[indexPath]
    }
    
}
