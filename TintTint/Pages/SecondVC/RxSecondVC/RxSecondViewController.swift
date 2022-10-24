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
       
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: self.view.bounds, collectionViewLayout: creatLayout())
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        self.regisCell()
        self.setupCellBinding()
        self.setitemModelsBinding()
        self.viewModel.downloadList()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        TempDataCenter.shared.removeAllModel()
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
    
    func setitemModelsBinding() {
        viewModel.itemModels
            .asDriver(onErrorJustReturn: [])
            .drive(self.collectionView.rx.items(cellIdentifier: "ImageCell", cellType: ImageCell.self)) { item, imageModel, cell in
                cell.rxItemModel = .init(id: String(imageModel.id ?? 0),
                                               title: imageModel.title,
                                               imageUrl: imageModel.urlStr,
                                               itemSize: .init(width: self.view.bounds.width / 2, height: self.view.bounds.width / 2))
            }.disposed(by: self.disposeBag)
    }

    
    func setupCellBinding(){

        collectionView.rx.willDisplayCell
            .subscribe { cell,indexPath in
                    
                let count = self.collectionView.numberOfItems(inSection: 0)
                
                let page = (try? self.viewModel.page.value()) ?? 0
                
                if indexPath.item == count - 1, TempDataCenter.shared.hasMore {
                    self.viewModel.page.onNext(page + 1)
                }
            }.disposed(by: self.disposeBag)

    }

}

