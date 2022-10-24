//
//  RxSecondViewModel.swift
//  TintTint
//
//  Created by yihuang on 2022/10/22.
//

import Foundation
import RxSwift
import RxCocoa

class RxSecondViewModel {
    
    let disposed = DisposeBag()
    
    var page = BehaviorSubject<Int>(value: 0)
    
    let itemModels : PublishSubject<[ImageModel]> = .init()
    
    
    init() {
        setupPageBinding()
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
            self.page.onNext(0)
        })
    }
    
    
    func setupPageBinding(){
        page
            .bind(onNext: { page in
                self.itemModels.onNext(TempDataCenter.shared.getPageModels(page: page))
            })
            .disposed(by: disposed)
    }
}
