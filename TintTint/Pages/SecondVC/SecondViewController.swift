//
//  SecondViewController.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import Foundation
import UIKit


class SecondViewController: BaseCollectionViewController {
    
    var imageListModel: ImageListModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadList()
    }
    
    func downloadList(){
        APIService.shared.downloadWithUrl(url: "https://jsonplaceholder.typicode.com/photos",
                                          modelType: ImageListModel.self,
                                          handler: { listModel in
            self.setupItemView(listModel: listModel)
        })
    }
    
    func setupItemView(listModel: ImageListModel ) {
        for imageModel in listModel.imageModels {
            print("sss")
            //TODO: - 產生cell
        }
    }

}

