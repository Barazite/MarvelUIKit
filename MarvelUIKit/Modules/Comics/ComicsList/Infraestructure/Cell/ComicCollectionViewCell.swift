//
//  ComicCollectionViewCell.swift
//  MarvelUIKit
//
//  Created by Adrian Sevilla Diaz on 30/8/21.
//

import UIKit
import Kingfisher

protocol ComicCollectionViewCellProtocol {
    func configCell(data: Comic)
}

class ComicCollectionViewCell: UICollectionViewCell, ReuseIdentifierInterface, ComicCollectionViewCellProtocol {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.myImage.layer.cornerRadius = 10
        self.myImage.layer.borderWidth = 2
        self.myImage.layer.borderColor = UIColor.red.cgColor
    }
    
    func configCell(data: Comic) {
        self.titleLabel.text = data.title
        let urlImage = URL(string: data.thumbnail ?? "")
        self.myImage.kf.setImage(with: ImageResource(downloadURL: urlImage!), placeholder: UIImage(systemName: "photo"), options: [.transition(.fade(1)), .cacheOriginalImage], completionHandler: nil)
    }
    
}
