//
//  SecondViewController.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import Foundation
import UIKit

class SecondViewController: BaseCollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.regisCell()
        self.downloadList()
    }
    
    func downloadList(){
        AFAPIService.shared.downloadJsonWithUrl(url: "https://jsonplaceholder.typicode.com/photos",
                                                modelType: ImageListModel.self,
                                                handler: { [weak self] listModel in
            guard let self = self else { return }
//
//            let templistModel = listModel
//
//            var tempimageModel: [ImageModel] = []
//
//            for (index,model) in listModel.imageModels.enumerated() {
//                if index < 200 {
//                    tempimageModel.append(model)
//                }
//
//            }
//            templistModel.imageModels = tempimageModel
            
            TempDataCenter.shared.setImageListModel(listModel: listModel)
            
            self.setupAllItems(models: TempDataCenter.shared.getPageModels(page: self.adapter?.page ?? 0))
        })
    }

    func setupAllItems(models: [ImageModel]) {
        self.adapter?.updateData(itemModels: models.map({self.creatImageCellItemModel(imageModel:$0)}))
    }

    func insertItemsAtLast(models: [ImageModel]) {
        self.adapter?.insertItemAtLast(itemModels: models.map({self.creatImageCellItemModel(imageModel:$0)}))
    }

    func creatImageCellItemModel(imageModel: ImageModel) -> ImageCellItemModel {
        let imageCellItemModel = ImageCellItemModel(id: String(imageModel.id ?? 0),
                                                    title: imageModel.title,
                                                    imageUrl: imageModel.urlStr,
                                                    itemSize: .init(width: self.collectionView.bounds.width / 4, height: self.collectionView.bounds.width / 4))
        return imageCellItemModel
    }

    func regisCell(){
        self.collectionView.register(.init(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
    }

    override func lastCellWillDisplay(page: Int) {
        self.adapter?.needKeepLoading = TempDataCenter.shared.hasMore
        if (self.adapter?.needKeepLoading ?? true) {
            self.setupAllItems(models: TempDataCenter.shared.getPageModels(page: page))
        }

    }

}

