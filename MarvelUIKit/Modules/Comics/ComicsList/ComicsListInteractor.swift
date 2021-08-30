// ComicsListInteractor.swift
// Architecture VIP+UI
//

import Foundation

protocol ComicsListInteractorProtocol {
    func fetchDataInteractor(offset: Int, success: @escaping(ComicData?) -> (), failure: @escaping(NetworkingError?) -> ())
}

class ComicsListInteractorImpl: BaseInteractor<ComicsListPresenterProtocol> {
    
    let provider: ComicsListProviderProtocol = ComicsListProviderImpl()
    
}

extension ComicsListInteractorImpl: ComicsListInteractorProtocol {
    func fetchDataInteractor(offset: Int, success: @escaping(ComicData?) -> (), failure: @escaping(NetworkingError?) -> ()) {
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

