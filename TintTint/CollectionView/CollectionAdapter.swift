//
//  CollectionAdapter.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import Foundation
import UIKit

class CollectionAdapter: NSObject {
    
    weak var collectionView: UICollectionView?
    
    var itemModels: [CollectionItemModel]? = []
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func updateData(itemModels:[CollectionItemModel]){
        self.collectionView?.reloadData()
    }
    
}

extension CollectionAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let itemModels = self.itemModels {
            return itemModels.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let itemModel = self.itemModels?[indexPath.item] else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemModel.getCellID(), for: indexPath)
        
        if let cell = cell as? CellBinding {
            cell.setupCellView(model: itemModel)
        }
        
        return cell
    }
    
}

extension CollectionAdapter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let itemModel = self.itemModels?[indexPath.item] else { return .zero }
        
        return itemModel.itemSize ?? .zero

    }
}

extension CollectionAdapter:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let itemModel = self.itemModels?[indexPath.item] else { return }
        
        if let action = itemModel.itemDidSelectAction {
            action(itemModel)
        }
    }
}
