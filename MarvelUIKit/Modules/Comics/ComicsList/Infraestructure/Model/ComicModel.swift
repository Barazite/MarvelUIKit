//
//  ComicModel.swift
//  MarvelUIKit
//
//  Created by Adrian Sevilla Diaz on 30/8/21.
//

import Foundation

struct Comic{
    let id : Int?
    let title: String?
    let thumbnail: String?
    let pages: Int
    let description: String
    
    init(businessModel: ComicResult){
        self.id = businessModel.id
        self.title = businessModel.title
        self.thumbnail = "\(businessModel.thumbnail?.path?.replacingOccurrences(of: "http", with: "https") ?? "")/standard_xlarge.\(businessModel.thumbnail?.thumbnailExtension ?? "")"
        self.pages = businessModel.pageCount ?? 0
        self.description = businessModel.resultDescription ?? ""
    }
}
