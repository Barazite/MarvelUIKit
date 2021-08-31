//
//  CreatorsServerlModel.swift
//  MarvelUIKit
//
//  Created by Adrian Sevilla Diaz on 30/8/21.
//

import Foundation

// MARK: - CreatorsServerModel
struct CreatorsServerModel: Codable {
    var code: Int?
    var status: String?
    var copyright: String?
    var attributionText: String?
    var attributionHTML: String?
    var etag: String?
    var data: CreatorData?

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
struct CreatorData: Codable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [CreatorResult]?

    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case limit = "limit"
        case total = "total"
        case count = "count"
        case results = "results"
    }
}

// MARK: - Result
struct CreatorResult: Codable {
    var id: Int?
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var suffix: String?
    var fullName: String?
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
        case firstName = "firstName"
        case middleName = "middleName"
        case lastName = "lastName"
        case suffix = "suffix"
        case fullName = "fullName"
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
