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
        super.init()
        self.collectionView = collectionView
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
    }
    
    func updateData(itemModels:[CollectionItemModel]){
        self.itemModels = itemModels
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
        itemModel.indexPath = indexPath
        itemModel.collectionView = collectionView
        
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
        
        if let action = itemModel.cellDidPressed {
            action(itemModel)
        }
    }
}
