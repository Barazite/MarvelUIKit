//
//  CharacterTableViewCell.swift
//  MarvelUIKit
//
//  Created by Adrian Sevilla Diaz on 24/8/21.
//

import UIKit
import Kingfisher

protocol CharacterTableViewCellProtocol {
    func configCell(data: Character)
}

class CharacterTableViewCell: UITableViewCell, ReuseIdentifierInterface, CharacterTableViewCellProtocol {
    
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
        self.myImage.layer.cornerRadius = 10
        self.myImage.layer.borderWidth = 2
        self.myImage.layer.borderColor = UIColor.red.cgColor
    }
    
    internal func configCell(data: Character){
        //let url = "\(data.thumbnail?.replacingOccurrences(of: "http", with: "https") ?? "")/standard_xlarge." + "\(data.extensionImage ?? "")"
        self.nameLabel.text = data.name
        let urlImage = URL(string: data.thumbnail ?? "")
        self.myImage.kf.setImage(with: ImageResource(downloadURL: urlImage!), placeholder: UIImage(systemName: "photo"), options: [.transition(.fade(1)), .cacheOriginalImage], completionHandler: nil)

    }
    
}
