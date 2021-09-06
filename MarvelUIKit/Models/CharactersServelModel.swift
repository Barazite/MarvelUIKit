//
//  CharactersServelModel.swift
//  MarvelUIKit
//
//  Created by Adrian Sevilla Diaz on 24/8/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let charactersServerModel = try? newJSONDecoder().decode(CharactersServerModel.self, from: jsonData)

import Foundation

// MARK: - CharactersServerModel
struct CharactersServerModel: Codable {
    var code: Int?
    var status: String?
    var copyright: String?
    var attributionText: String?
    var attributionHTML: String?
    var etag: String?
    var data: CharacterData?

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case status = "status"
        case copyright = "copyright"
        case attributionText = "attributionText"
        case attributionHTML = "attributionHTML"
        case etag = "etag"
        case data = "data"
    }
}

// MARK: - DataClass
struct CharacterData: Codable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [CharacterResult]?

    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case limit = "limit"
        case total = "total"
        case count = "count"
        case results = "results"
    }
}

// MARK: - Result
struct CharacterResult: Codable {
    var id: Int?
    var name: String?
    var resultDescription: String?
    var modified: String?
    var thumbnail: Thumbnail?
    var resourceURI: String?
    var comics: Comics?
    var series: Comics?
    var stories: Stories?
    var events: Comics?
    var urls: [URLElement]?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case resultDescription = "description"
        case modified = "modified"
        case thumbnail = "thumbnail"
        case resourceURI = "resourceURI"
        case comics = "comics"
        case series = "series"
        case stories = "stories"
        case events = "events"
        case urls = "urls"
    }
}

// MARK: - Comics
struct Comics: Codable {
    var available: Int?
    var collectionURI: String?
    var items: [ComicsItem]?
    var returned: Int?

    enum CodingKeys: String, CodingKey {
        case available = "available"
        case collectionURI = "collectionURI"
        case items = "items"
        case returned = "returned"
    }
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    var resourceURI: String?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case resourceURI = "resourceURI"
        case name = "name"
    }
}

// MARK: - Stories
struct Stories: Codable {
    var available: Int?
    var collectionURI: String?
    var items: [StoriesItem]?
    var returned: Int?

    enum CodingKeys: String, CodingKey {
        case available = "available"
        case collectionURI = "collectionURI"
        case items = "items"
        case returned = "returned"
    }
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    var resourceURI: String?
    var name: String?
    var type: String?

    enum CodingKeys: String, CodingKey {
        case resourceURI = "resourceURI"
        case name = "name"
        case type = "type"
    }
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    var path: String?
    var thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path = "path"
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElement: Codable {
    var type: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case url = "url"
    }
}
