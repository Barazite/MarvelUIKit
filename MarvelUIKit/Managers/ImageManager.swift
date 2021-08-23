//
//  ImageManager.swift
//

import Foundation

class ImageManager{
    
    var data =  Data()
    
    internal func getImageFromUrl(imageUrl : String){
        guard let url = URL(string: imageUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
