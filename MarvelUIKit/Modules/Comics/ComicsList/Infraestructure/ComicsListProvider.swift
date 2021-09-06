// ComicsListProvider.swift
// Architecture VIPER
//

import Foundation
import Combine

protocol ComicsListProviderProtocol {
    func fetchData(offset: Int, completionHandler: @escaping (Result<ComicsServerModel, NetworkingError>) -> ())
}

class ComicsListProviderImpl: ComicsListProviderProtocol {

    let provider: RequestManagerProtocol = RequestManager()
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchData(offset: Int, completionHandler: @escaping (Result<ComicsServerModel, NetworkingError>) -> ()) {
        
        let request = RequestDTO(params: ["limit": Limit.limitComics, "offset": offset],
                                 method: .get,
                                 endpoint: URLEndpoint.baseUrl+URLEndpoint.comicsUrl)
        
        self.provider.requestGeneric(requestDto: request, entityClass: ComicsServerModel.self)
            .sink { [weak self] (completion) in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    completionHandler(.failure(error))
                }
        } receiveValue: { [weak self] response in
            guard self != nil else { return }
            completionHandler(.success(response))
        }.store(in: &cancellable)
    }
}


