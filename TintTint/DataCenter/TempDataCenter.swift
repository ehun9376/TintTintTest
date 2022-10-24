//
//  TempDataCenter.swift
//  TintTint
//
//  Created by yihuang on 2022/10/21.
//

import Foundation
import RxSwift

class TempDataCenter: NSObject {
    
    static let shared = TempDataCenter()
    
    private var imageListModel: ImageListModel?
    
    private var models: [ImageModel] = []
    
    var hasMore: Bool {
        if let images = imageListModel?.imageModels {
            return models.count < images.count
        }
        return false
    }
    
     func getPageImageModels(page: Int) -> [ImageModel] {
        
        let start =  page * 20
        
        let end = start + 20
        
        var models: [ImageModel] = []
        
        for i in start..<end {
            if let imageModels = self.imageListModel?.imageModels {
                if let model = imageModels[safe:i] {
                    models.append(model)
                } else {
                    break
                }
            }
        }
        return models
    }

    
    func getPageModels(page:Int) -> [ImageModel] {
        models = models + getPageImageModels(page: page)
        return models
    }
    
    func removeAllModel() {
        self.models.removeAll()
        self.imageListModel = nil
    }
    
    func setImageListModel(listModel:ImageListModel){
        self.imageListModel = listModel
    }

}


