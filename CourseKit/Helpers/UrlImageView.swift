//
//  UrlImageView.swift
//  AnimalsTestTask
//
//  Created by Anna Dluzhinskaya on 09.04.2022.
//

import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    static var defaultImage = UIImage(named: viewAssets.placeholder)
    var body: some View {
        VStack {
            Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
                .resizable()
        }
        
    }
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}
