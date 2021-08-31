//
//  CreatorsViewController.swift
//  MarvelUIKit
//
//  Created by Adrian Sevilla Diaz on 30/8/21.
//

import UIKit
import WebKit

protocol CreatorsViewControllerProtocol {
    func reloadData()
}

class CreatorsViewController: BaseViewController<CreatorsPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var myWebView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.setupWebView()
        self.presenter?.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupCollectionView() {
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        self.myCollectionView.register(UINib(nibName: CreatorCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CreatorCollectionViewCell.defaultReuseIdentifier)
    }
    
    private func setupWebView(){
        self.myWebView.navigationDelegate = self
        WKWebpagePreferences().allowsContentJavaScript = true
    }
}

extension CreatorsViewController: CreatorsViewControllerProtocol {
    
    func reloadData(){
        myCollectionView.reloadData()
    }
}

extension CreatorsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.presenter?.getNumberOfRowInSections() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.myCollectionView.dequeueReusableCell(withReuseIdentifier: CreatorCollectionViewCell.defaultReuseIdentifier, for: indexPath) as! CreatorCollectionViewCell
        if let data = self.presenter?.getInformationObject(indexPath: indexPath.row) {
            cell.configCell(data: data)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = self.presenter?.getInformationObject(indexPath: indexPath.row) {
            self.myWebView.load(URLRequest(url: data.url!))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if ((self.presenter?.getNumberOfRowInSections())!-5) == indexPath.row{
            self.presenter?.fetchData()
        }
    }
}

extension CreatorsViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
    }
}
