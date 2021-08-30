//
//  CharactersListViewController.swift
//  MarvelUIKit
//
//  Created by Adrian Sevilla Diaz on 26/8/21.
//
import UIKit

protocol CharactersListViewControllerProtocol {
    func reloadData()
}

class CharactersListViewController: BaseViewController<CharactersListPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.presenter?.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myTableView.reloadData()
    }
    
    private func setupTableView() {
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.register(UINib(nibName: CharacterTableViewCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: CharacterTableViewCell.defaultReuseIdentifier)
    }
}

extension CharactersListViewController: CharactersListViewControllerProtocol {
    func reloadData(){
            myTableView.reloadData()
        }
}

extension CharactersListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.getNumberOfRowInSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.defaultReuseIdentifier, for: indexPath) as! CharacterTableViewCell
        if let modelData = self.presenter?.getInformationObject(indexPath: indexPath.row){
            cell.configCell(data: modelData)
        }else{
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = self.presenter?.getInformationObject(indexPath: indexPath.row){
            self.presenter?.showDetailCharacter(data: data)
        }
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if ((self.presenter?.getNumberOfRowInSections())!-3) == indexPath.row{
            self.presenter?.fetchData()
        }
    }
    
    
}
