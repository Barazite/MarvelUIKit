// CharactersDetailsViewController.swift
// Architecture VIPER
//

import UIKit
import Kingfisher

protocol CharactersDetailsViewControllerProtocol {
    
}

class CharactersDetailsViewController: BaseViewController<CharactersDetailsPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let character = presenter?.getInformationObject()
        self.nameLabel.text = character?.name
        self.myImage.kf.setImage(with: ImageResource(downloadURL: URL(string: character?.thumbnail ?? "")!), placeholder: UIImage(systemName: "person"), options: [.transition(.fade(1)), .cacheOriginalImage], completionHandler: nil)
        self.descriptionLabel.text = character?.description
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension CharactersDetailsViewController: CharactersDetailsViewControllerProtocol {
    
    
}
