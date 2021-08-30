//
//  RequestManager.swift
//

import Foundation
import Combine

protocol RequestManagerProtocol: AnyObject {
    func requestGeneric<T: Decodable>(requestDto: RequestDTO, entityClass: T.Type) -> AnyPublisher<T, NetworkingError>
}

class RequestManager: RequestManagerProtocol {
    
    internal func requestGeneric<T: Decodable>(requestDto: RequestDTO, entityClass: T.Type) -> AnyPublisher<T, NetworkingError>{
        
        let endpoint = requestDto.endpoint
        var urlComp = URLComponents(url: URL(string: endpoint)!, resolvingAgainstBaseURL: false)
        let ts = "\(Int(round(Date().timeIntervalSince1970)))"
        let hash = (ts+MarvelApiKeys.privateKey+MarvelApiKeys.publicKey).md5()
        var queryItemsArray = [URLQueryItem(name: "apikey", value: MarvelApiKeys.publicKey), URLQueryItem(name: "ts", value: ts), URLQueryItem(name: "hash", value: hash)]
        requestDto.params?.forEach{(key, value) in
            queryItemsArray.append(URLQueryItem(name: key, value: "\(value)"))
        }
        urlComp?.queryItems = queryItemsArray
        let urlRequest = (urlComp?.url)!
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .mapError{ (error) -> NetworkingError in
                NetworkingError(error: error)
            }
            .flatMap { data, response -> AnyPublisher<T, NetworkingError> in
                guard let httpResponse = response as? HTTPURLResponse else {
                    return Fail(error: NetworkingError(status: .badRequest)).eraseToAnyPublisher()
                }
                if (200...299).contains(httpResponse.statusCode){
                    return Just(data)
                        .decode(type: T.self, decoder: JSONDecoder())
                        .mapError { error  in
                            NetworkingError(status: .accepted)
                        }
                        .eraseToAnyPublisher()//Libera la memoria
                } else {
                    let error = ApiError.unknow
                    return Fail(error: NetworkingError(error: error)).eraseToAnyPublisher()
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
