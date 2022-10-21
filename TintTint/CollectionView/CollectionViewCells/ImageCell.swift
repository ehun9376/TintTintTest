//
//  ImageCell.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import Foundation
import UIKit

class ImageCellItemModel: CollectionItemModel {
    override func getCellID() -> String {
        return "ImageCell"
    }
}

class ImageCell: UICollectionViewCell {

}

extension ImageCell: CellBinding {
    func setupCellView(model: CellModel) {
        guard let itemModel = model as? ImageCellItemModel else { return }
    }
}
