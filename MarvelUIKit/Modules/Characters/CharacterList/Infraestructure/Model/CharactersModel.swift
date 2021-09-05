//
//  CharactersModel.swift
//  MarvelUIKit
//
//  Created by Adrian Sevilla Diaz on 24/8/21.
//

import Foundation

struct Character{
    let id : Int?
    let name: String?
    let thumbnail: String?
    
    init(businessModel: CharacterResult){
        self.id = businessModel.id
        self.name = businessModel.name
        self.thumbnail = "\(businessModel.thumbnail?.path?.replacingOccurrences(of: "http", with: "https") ?? "")/standard_xlarge.\(businessModel.thumbnail?.thumbnailExtension ?? "")"
    }
}
