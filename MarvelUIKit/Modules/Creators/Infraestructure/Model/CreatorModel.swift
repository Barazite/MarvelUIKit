//
//  CreatorModel.swift
//  MarvelUIKit
//
//  Created by Adrian Sevilla Diaz on 30/8/21.
//

import Foundation

struct Creator{
    let id : Int?
    let name: String?
    let thumbnail: String?
    let url: URL?
    
    init(businessModel: CreatorResult){
        self.id = businessModel.id
        self.name = businessModel.fullName
        self.thumbnail = "\(businessModel.thumbnail?.path?.replacingOccurrences(of: "http", with: "https") ?? "")/standard_xlarge.\(businessModel.thumbnail?.thumbnailExtension ?? "")"
        self.url = URL(string: businessModel.urls?[0].url?.replacingOccurrences(of: "http", with: "https") ?? "https://marvel.com/")
    }
}
