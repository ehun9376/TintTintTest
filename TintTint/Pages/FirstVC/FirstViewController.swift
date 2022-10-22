//
//  ViewController.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa

class FirstViewController: UIViewController {
    
    let disposed = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.setupCenterButton()
    }
    
    func setupCenterButton() {
        
        
        
        let goToRxButton = CustomButton(title: "ReusetAPI(RxSecondView)", titleColor: .blue)
        
        let goToSecondVCButton = CustomButton(title: "ReusetAPI(SecondView)", titleColor: .blue)
        
        goToRxButton.rx.tap
            .subscribe(onNext: { [weak self] in
                let rxVC = RxSecondViewController()
                self?.navigationController?.pushViewController(rxVC, animated: true)
            })
            .disposed(by: disposed)
        
        goToSecondVCButton.rx.tap
            .subscribe(onNext: { [weak self] in
                let vc = SecondViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposed)
        
        self.view.addSubview(goToRxButton)
        goToRxButton.translatesAutoresizingMaskIntoConstraints = false
        goToRxButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        goToRxButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.view.addSubview(goToSecondVCButton)
        goToSecondVCButton.translatesAutoresizingMaskIntoConstraints = false
        goToSecondVCButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        goToSecondVCButton.topAnchor.constraint(equalTo: goToRxButton.bottomAnchor, constant: 20.0).isActive = true


    }

}
