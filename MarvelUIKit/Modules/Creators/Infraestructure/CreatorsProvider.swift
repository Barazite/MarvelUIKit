// CreatorsProvider.swift
// Architecture VIPER
//

import Foundation
import Combine

protocol CreatorsProviderProtocol {
    func fetchData(offset: Int, completionHandler: @escaping (Result<CreatorsServerModel, NetworkingError>) -> ())
}

class CreatorsProviderImpl: CreatorsProviderProtocol {

    let provider: RequestManagerProtocol = RequestManager()
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchData(offset: Int, completionHandler: @escaping (Result<CreatorsServerModel, NetworkingError>) -> ()) {
        
        let request = RequestDTO(params: ["limit": Limit.limitCreators, "offset": offset],
                                 method: .get,
                                 endpoint: URLEndpoint.baseUrl+URLEndpoint.creatorsUrl)
        
        self.provider.requestGeneric(requestDto: request, entityClass: CreatorsServerModel.self)
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


