//
//  BaseCollectionViewController.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import Foundation

class BaseCollectionViewController: UIViewController {
    
    lazy var collectionView: UICollectionView =  {
        let view = UICollectionView(frame: self.view.bounds, collectionViewLayout: creatLayout())
        return view
    }()
    
    func creatLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
    }
}
