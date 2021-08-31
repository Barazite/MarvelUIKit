// CreatorsInteractor.swift
// Architecture VIP+UI
//

import Foundation

protocol CreatorsInteractorProtocol {
    func fetchDataInteractor(offset: Int, success: @escaping(CreatorData?) -> (), failure: @escaping(NetworkingError?) -> ())
}

class CreatorsInteractorImpl: BaseInteractor<CreatorsPresenterProtocol> {
    
    let provider: CreatorsProviderProtocol = CreatorsProviderImpl()
    
}

extension CreatorsInteractorImpl: CreatorsInteractorProtocol {
    func fetchDataInteractor(offset: Int, success: @escaping(CreatorData?) -> (), failure: @escaping(NetworkingError?) -> ()) {
        self.provider.fetchData(offset: offset){ [weak self] (result) in
            guard self != nil else { return }
            switch result{
            case .success(let response):
                success(response.data)
            case .failure(let error):
                failure(error)
            }
        }
    }
}

