//
//  UrlImageModel.swift
//  AnimalsTestTask
//
//  Created by Anna Dluzhinskaya on 09.04.2022.
//

import Foundation
import SwiftUI

class UrlImageModel: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    
    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }
    
    func loadImage() {
        loadImageFromUrl()
    }
    
    func loadImageFromUrl() {
        guard urlString != "" else {
            return
        }
        
        guard let urlString1 = urlString else {
            return
        }
        
        let url = URL(string: urlString1)!
        let task = URLSession.shared.dataTask(with: url, completionHandler:
                                                getImageFromResponse(data:response:error:))
        task.resume()
    }
    
    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        
        guard let data = data else {
            print("No data found")
            return
        }
        
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            
            self.image = loadedImage
        }
    }
}
