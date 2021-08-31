//
//  ComicsListViewController.swift
//  MarvelUIKit
//
//  Created by Adrian Sevilla Diaz on 30/8/21.
//

import UIKit

protocol ComicsListViewControllerProtocol {
    func reloadData()
}

class ComicsListViewController: BaseViewController<ComicsListPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.presenter?.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupCollectionView() {
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        self.myCollectionView.register(UINib(nibName: ComicCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ComicCollectionViewCell.defaultReuseIdentifier)
    }
}

extension ComicsListViewController: ComicsListViewControllerProtocol {
    
    func reloadData(){
        myCollectionView.reloadData()
    }
}

extension ComicsListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.presenter?.getNumberOfRowInSections() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.myCollectionView.dequeueReusableCell(withReuseIdentifier: ComicCollectionViewCell.defaultReuseIdentifier, for: indexPath) as! ComicCollectionViewCell
        if let data = self.presenter?.getInformationObject(indexPath: indexPath.row) {
            cell.configCell(data: data)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = self.presenter?.getInformationObject(indexPath: indexPath.row){
            self.presenter?.showDetailComic(data: data)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = UICollectionViewFlowLayout()
        let cellSpacing = CGFloat(1)
        let leftRightMargin = CGFloat(10)
        let numColumns = CGFloat(2)
        let totalCellSpace = cellSpacing * (numColumns - 1)
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth - leftRightMargin - totalCellSpace) / numColumns
        var height = CGFloat(270)
        height = width * height / 180
        flowLayout.itemSize = CGSize(width: width, height: height)
        return flowLayout.itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if ((self.presenter?.getNumberOfRowInSections())!-10) == indexPath.row{
            self.presenter?.fetchData()
        }
    }
}


