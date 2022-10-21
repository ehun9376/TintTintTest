//
//  itemModelBase.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import Foundation
import UIKit

protocol CellModel {
    func getCellID() -> String
}
protocol CellBinding{
    func setupCellView(model: CellModel)
}

class CollectionItemModel: CellModel {
    
    var itemSize: CGSize?
    var indexPath: IndexPath?
    
    var cellDidPressed: ((CollectionItemModel?) -> ())?
    weak var collectionView: UICollectionView?

    func getCellID() -> String {
        fatalError("Need Override")
    }
    
    init(itemSize: CGSize? = nil, itemDidSelectAction: ((CollectionItemModel?) -> ())? = nil) {
        self.itemSize = itemSize
        if let itemDidSelectAction = itemDidSelectAction {
            self.cellDidPressed = itemDidSelectAction
        }
    }
    
    func updateCellView(){
        if let indexPath = self.indexPath {
            self.collectionView?.reloadItems(at: [indexPath])
        }
    }

}
