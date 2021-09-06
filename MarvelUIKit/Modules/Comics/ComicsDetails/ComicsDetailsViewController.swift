// ComicsDetailsViewController.swift
// Architecture VIPER
//

import UIKit
import Kingfisher

protocol ComicsDetailsViewControllerProtocol {
    
}

class ComicsDetailsViewController: BaseViewController<ComicsDetailsPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var pagesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let comic = presenter?.getInformationObject()
        self.nameLabel.text = comic?.title
        self.myImage.kf.setImage(with: ImageResource(downloadURL: URL(string: comic?.thumbnail ?? "")!), placeholder: UIImage(systemName: "photo"), options: [.transition(.fade(1)), .cacheOriginalImage], completionHandler: nil)
        self.pagesLabel.text = "Pages: \(comic?.pages ?? 0)"
        self.descriptionLabel.text = comic?.description
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension ComicsDetailsViewController: ComicsDetailsViewControllerProtocol {
    
    
}
