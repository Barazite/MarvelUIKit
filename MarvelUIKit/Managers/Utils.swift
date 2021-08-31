//
//  Utils.swift
//

import Foundation

enum ApiError: Error, LocalizedError{
    case unknow, apiError(reason: String)
    var errorDescription: String?{
        switch self {
        case .unknow:
            return "Unknown error"
        case .apiError(let error):
            return error
        }
    }
}

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}


struct RequestDTO{
    var params: [String: Any]?
    var method: HTTPMethods
    var endpoint: String
    
    init(params: [String: Any]?, method: HTTPMethods, endpoint: String){
        self.params = params
        self.method = method
        self.endpoint = endpoint
    }
}

struct URLEndpoint {
    static let baseUrl = "https://gateway.marvel.com/v1/public/"
    static let charactersUrl = "characters"
    static let comicsUrl = "comics"
    static let creatorsUrl = "creators"
}

struct Limit{
    static let limitCharacters = 30
    static let limitComics = 50
    static let limitCreators = 20
}
