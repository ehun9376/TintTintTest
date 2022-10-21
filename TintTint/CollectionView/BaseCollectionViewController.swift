//
//  BaseCollectionViewController.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import Foundation
import UIKit

class BaseCollectionViewController: UIViewController {
    
    lazy var collectionView: UICollectionView =  {
        let view = UICollectionView(frame: self.view.bounds, collectionViewLayout: creatLayout())
        return view
    }()
    
    var adapter: CollectionAdapter?
    
    func creatLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        self.adapter = .init(collectionView: self.collectionView)
        self.adapter?.lastCellDidDisplay = { page in
            self.lastCellWillDisplay(page: page)
        }
    }
    
    func lastCellWillDisplay(page:Int){ }
    
}
