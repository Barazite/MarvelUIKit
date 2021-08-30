// CharactersListProvider.swift
// Architecture VIPER
//

import Foundation
import Combine

protocol CharactersListProviderProtocol {
    func fetchData(offset: Int, completionHandler: @escaping (Result<CharactersServerModel, NetworkingError>) -> ())
}

class CharactersListProviderImpl: CharactersListProviderProtocol {

    let provider: RequestManagerProtocol = RequestManager()
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchData(offset: Int, completionHandler: @escaping (Result<CharactersServerModel, NetworkingError>) -> ()) {
        
        let request = RequestDTO(params: ["limit": Limit.limitCharacters, "offset": offset],
                                 method: .get,
                                 endpoint: URLEndpoint.baseUrl+URLEndpoint.charactersUrl)
        
        self.provider.requestGeneric(requestDto: request, entityClass: CharactersServerModel.self)
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


