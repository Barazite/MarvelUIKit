// CharactersListInteractor.swift
// Architecture VIP+UI
//

import Foundation
//import Alamofire

protocol CharactersListInteractorProtocol {
    func fetchDataInteractor(offset: Int, success: @escaping(CharacterData?) -> (), failure: @escaping(NetworkingError?) -> ())
    
}

class CharactersListInteractorImpl: BaseInteractor<CharactersListPresenterProtocol> {
    
    let provider: CharactersListProviderProtocol = CharactersListProviderImpl()
    
}

extension CharactersListInteractorImpl: CharactersListInteractorProtocol {
    func fetchDataInteractor(offset: Int, success: @escaping(CharacterData?) -> (), failure: @escaping(NetworkingError?) -> ()) {
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
    
//    func fetchDataInteractor(success: @escaping([CharacterResult]?) -> (), failure: @escaping(AFError?) -> ()) {
//        let ts = "\(Date().timeIntervalSince1970)"
//        let hash = (ts+MarvelApiKeys.privateKey+MarvelApiKeys.publicKey).md5()
//        let params : [String : Any] = ["ts" : ts, "apikey" : MarvelApiKeys.publicKey, "hash" : hash, "limit": 20, "offset": 0]
//
//        let url = URLEndpoint.baseUrl+URLEndpoint.charactersUrl
//
//        AF.request(url, parameters: params).validate().responseDecodable(of: CharactersServerModel.self){ response in
//            switch response.result{
//            case.failure(let error):
//                print(error)
//            case .success(let value):
//                success(value.data?.results)
//            }
//        }
//    }
}

