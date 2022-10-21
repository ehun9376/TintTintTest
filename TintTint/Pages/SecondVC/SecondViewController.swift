//
//  SecondViewController.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class SecondViewController: BaseCollectionViewController {
    
    var imageListModel: Observable<ImageListModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.regisCell()
        self.downloadList()
    }
    
    func downloadList(){
        AFAPIService.shared.downloadJsonWithUrl(url: "https://jsonplaceholder.typicode.com/photos",
                                              modelType: ImageListModel.self,
                                              handler: {  listModel in
            
            self.imageListModel = .create({ observer -> Disposable in
                observer.onNext(listModel)
                observer.onCompleted()
                return Disposables.create()
            })
            
            self.imageListModel?.subscribe(onNext: { imageListModel in
                self.setupItemView(listModel: imageListModel)
            }).dispose()
        })
    }
    
    func setupItemView(listModel: ImageListModel ) {
        
        var itemModels: [CollectionItemModel]? = []
            for imageModel in listModel.imageModels {

                let imageCellItemModel = ImageCellItemModel(id: String(imageModel.id ?? 0),
                                                            title: imageModel.title,
                                                            itemSize: .init(width: self.collectionView.bounds.width / 4, height: self.collectionView.bounds.width / 4))
                
                imageCellItemModel.cellWillDisplay = {
                    AFAPIService.shared.downloadImageWithUrl(url: imageModel.urlStr ?? "") { image in
                        DispatchQueue.main.async {
                            imageCellItemModel.image = image
                            imageCellItemModel.updateCellView()
                        }
                    }
                }
                
                itemModels?.append(imageCellItemModel)

            
            self.adapter?.updateData(itemModels: itemModels ?? [])
        }

    }
    
    func regisCell(){
        self.collectionView.register(.init(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
    }

}

