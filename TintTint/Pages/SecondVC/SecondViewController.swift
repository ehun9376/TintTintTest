//
//  SecondViewController.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import Foundation
import UIKit

class SecondViewController: BaseCollectionViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.regisCell()
//        self.downloadList()
//    }
//
//    func downloadList(){
//        AFAPIService.shared.downloadJsonWithUrl(url: "https://jsonplaceholder.typicode.com/photos",
//                                                modelType: ImageListModel.self,
//                                                handler: { [weak self] listModel in
//            guard let self = self else { return }
//            TempDataCenter.shared.imageListModel = listModel
//            self.insertItemsAtLast(models: TempDataCenter.shared.getPageImageModels(page: self.adapter?.page ?? 0))
//        })
//    }
//
//    //要分頁讀取所以用不到
//    func setupAllItems(models: [ImageModel]) {
//        self.adapter?.updateData(itemModels: models.map({self.creatImageCellItemModel(imageModel:$0)}))
//    }
//
//    func insertItemsAtLast(models: [ImageModel]) {
//        self.adapter?.insertItemAtLast(itemModels: models.map({self.creatImageCellItemModel(imageModel:$0)}))
//    }
//
//    func creatImageCellItemModel(imageModel: ImageModel) -> ImageCellItemModel {
//        let imageCellItemModel = ImageCellItemModel(id: String(imageModel.id ?? 0),
//                                                    title: imageModel.title,
//                                                    itemSize: .init(width: self.collectionView.bounds.width / 4, height: self.collectionView.bounds.width / 4))
//
//        imageCellItemModel.cellWillDisplay = {
//            AFAPIService.shared.downloadImageWithUrl(url: imageModel.urlStr ?? "") { image in
//                DispatchQueue.main.async {
//                    imageCellItemModel.image = image
//                    imageCellItemModel.updateCellView()
//                }
//            }
//        }
//        return imageCellItemModel
//    }
//
//    func regisCell(){
//        self.collectionView.register(.init(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
//    }
//
//    override func lastCellWillDisplay(page: Int) {
//        let needKeep = self.adapter?.needKeepLoading ?? true
//        if needKeep {
//            let models = TempDataCenter.shared.getPageImageModels(page: page)
//            if !(models.count < 20) {
//                self.insertItemsAtLast(models: models)
//            } else {
//                self.insertItemsAtLast(models: models)
//                self.adapter?.needKeepLoading = false
//            }
//        }
//    }

}

