//
//  RxSecondViewController.swift
//  TintTint
//
//  Created by yihuang on 2022/10/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class RxSecondViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let viewModel = RxSecondViewModel()
    
    var itemModels = PublishSubject<[ImageModel]>()
        
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: self.view.bounds, collectionViewLayout: creatLayout())
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        self.regisCell()
        self.setupViewModelBinding()
        self.setupCellBinding()
        self.viewModel.downloadList()
    }
    
    func creatLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: self.view.bounds.width / 4, height: self.view.bounds.width / 4)
        
        return layout
    }
    
    func regisCell(){
        self.collectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
    }
    
    func setupViewModelBinding() {
        viewModel
            .itemModels
            .observe(on: MainScheduler.instance)
            .bind(to: self.itemModels)
            .disposed(by: self.disposeBag)
    }
    
    func setupCellBinding(){
        
        itemModels
            .bind(to: self.collectionView.rx.items(cellIdentifier: "ImageCell", cellType: ImageCell.self)) { item, imageModel, cell in
                cell.titleLabel.text = imageModel.title
                cell.idLabel.text = String(imageModel.id ?? 0)
                cell.backImageView.loadImage(fromURL: imageModel.urlStr ?? "")
            }.disposed(by: self.disposeBag)
        
        collectionView.rx.willDisplayCell
            .subscribe { cell,indexPath in
                //TODO: -
            }.disposed(by: self.disposeBag)
            

    }
    
}

