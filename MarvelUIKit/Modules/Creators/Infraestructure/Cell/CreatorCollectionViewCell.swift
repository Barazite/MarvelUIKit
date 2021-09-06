//
//  CreatorCollectionViewCell.swift
//  MarvelUIKit
//
//  Created by Adrian Sevilla Diaz on 31/8/21.
//

import UIKit
import Kingfisher

protocol CreatorCollectionViewCellProtocol {
    func configCell(data: Creator)
}

class CreatorCollectionViewCell: UICollectionViewCell, ReuseIdentifierInterface, CreatorCollectionViewCellProtocol {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.myImage.layer.cornerRadius = self.myImage.frame.height/2
        self.myImage.layer.borderWidth = 2
        self.myImage.layer.borderColor = UIColor.red.cgColor
    }

    func configCell(data: Creator) {
        self.nameLabel.text = data.name
        let urlImage = URL(string: data.thumbnail ?? "")
        self.myImage.kf.setImage(with: ImageResource(downloadURL: urlImage!), placeholder: UIImage(systemName: "photo"), options: [.transition(.fade(1)), .cacheOriginalImage], completionHandler: nil)
    }
}
