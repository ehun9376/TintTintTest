//
//  ImageCell.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ImageCellItemModel: CollectionItemModel {
    
    override func getCellID() -> String {
        return "ImageCell"
    }
    
    var id: String?
    
    var title: String?
        
    var imageUrl: String?
        
    init(
        id: String? = nil,
        title: String? = nil,
        imageUrl: String? = nil,
        itemSize: CGSize? = nil,
        cellDidPressed: ((CollectionItemModel?) -> ())? = nil
    ) {
        super.init()
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
        self.itemSize = itemSize
        self.cellDidPressed = cellDidPressed
    }
}

class ImageCell: UICollectionViewCell {

    @IBOutlet weak var labelStackView: UIStackView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var rxItemModel: ImageCellItemModel? {
        didSet {
            self.titleLabel.text = rxItemModel?.title
            self.idLabel.text = rxItemModel?.id
            self.backImageView.loadImage(fromURL: rxItemModel?.imageUrl ?? "")
        }
    }
        
    override func awakeFromNib() {
        self.labelStackView.spacing = 10
        self.labelStackView.distribution = .fillEqually
        
        self.titleLabel.font = .systemFont(ofSize: 16)
        self.titleLabel.numberOfLines = 1
        self.titleLabel.lineBreakMode = .byTruncatingTail
        self.titleLabel.textAlignment = .center
        
        self.idLabel.font = .systemFont(ofSize: 16)
        self.idLabel.numberOfLines = 2
        self.idLabel.lineBreakMode = .byTruncatingTail
        self.idLabel.textAlignment = .center
        
    }

}

extension ImageCell: CellBinding {
    func setupCellView(model: CellModel) {
        guard let itemModel = model as? ImageCellItemModel else { return }
        
        self.titleLabel.text = itemModel.title
        
        self.idLabel.text = itemModel.id
        
        self.backImageView.loadImage(fromURL: itemModel.imageUrl ?? "")

    }
}
