//
//  ImageModel.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import Foundation

class ImageListModel: JsonModel {
    
    var imageModels: [ImageModel] = []

    required init(json: [String : Any]) {
        if let jsonArray = json["Array"] as? [[String:Any]] {
            self.imageModels = jsonArray.map({ json in
                return ImageModel(json: json)
            })
        }
    }
}

class ImageModel: JsonModel {

    var id: Int? = 0
    
    var title: String? = ""
    
    var urlStr: String? = ""
    
    required init(json: [String : Any]) {
        self.id = json["id"] as? Int
        self.title = json["title"] as? String
        self.urlStr = json["thumbnailUrl"] as? String
    }

}
