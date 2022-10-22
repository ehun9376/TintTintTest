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
    
//    var page = PublishSubject<Int>()
    
    var itemModels = PublishSubject<[ImageModel]>()
    
    func downloadList(){
        AFAPIService.shared.downloadJsonWithUrl(url: "https://jsonplaceholder.typicode.com/photos",
                                                modelType: ImageListModel.self,
                                                handler: { [weak self] listModel in
            guard let self = self else { return }
            TempDataCenter.shared.imageListModel = listModel
            self.itemModels.onNext(TempDataCenter.shared.imageListModel?.imageModels ?? [])
//            self.page.onNext(0)
        })
    }
    
//    func setupPageBinding(){
//
//        page.subscribe(onNext: { page in
//            self.itemModels?.onNext(TempDataCenter.shared.getPageImageModels(page: page))
//        }).disposed(by: disposed)
//    }
//
//    init() {
//        setupPageBinding()
//    }
}
