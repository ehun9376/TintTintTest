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
    func setupCellView(model:CellModel)
}

class CollectionItemModel: CellModel {
    
    var itemSize: CGSize?
    var indexPath: IndexPath?
    weak var collectionView: UICollectionView?
    
    var itemDidSelectAction: ((CollectionItemModel?) -> ())?

    func getCellID() -> String {
        fatalError("Need Override")
    }
    
    init(itemSize: CGSize? = nil, itemDidSelectAction: ((CollectionItemModel?) -> ())? = nil) {
        self.itemSize = itemSize
        if let itemDidSelectAction = itemDidSelectAction {
            self.itemDidSelectAction = itemDidSelectAction
        }
    }
    
    func getItemMaxSize() -> CGSize? {
        return self.itemSize
    }
}
