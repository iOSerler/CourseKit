//
//  UrlImageView.swift
//  AnimalsTestTask
//
//  Created by Anna Dluzhinskaya on 09.04.2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    
    var body: some View {
        VStack {
            
            if let image = urlImageModel.image {
                Image(uiImage: image).resizable()
            } else {
                Image(systemName: "photo.artframe")
            }
                
        }
        
    }
}

@available(iOS 15.0, *)
struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}
