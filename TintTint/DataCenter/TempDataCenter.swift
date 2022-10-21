//
//  TempDataCenter.swift
//  TintTint
//
//  Created by yihuang on 2022/10/21.
//

import Foundation

class TempDataCenter: NSObject {
        
    static let shared = TempDataCenter()
    
    var imageListModel: ImageListModel?
        
    func getPageImageModels(page: Int) -> [ImageModel] {
        let start =  page * 20
        let end = start + 20
        var models: [ImageModel] = []
        for i in start..<end {
            if let imageModels = self.imageListModel?.imageModels{
                if let model = imageModels[safe:i] {
                    models.append(model)
                } else {
                    break
                }
            }
            
        }
        return models
    }
    
}


