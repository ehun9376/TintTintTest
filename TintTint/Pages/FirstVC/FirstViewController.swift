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
        setupCenterButton()
    }
    
    func setupCenterButton(){
        let rxButton = CustomButton(title: "ReusetAPI", titleColor: .blue)
        
        rxButton.rx.tap
            .subscribe(onNext: { [weak self] in
                let vc = SecondViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposed)
        self.view.addSubview(rxButton)
        rxButton.translatesAutoresizingMaskIntoConstraints = false
        rxButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        rxButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

    }

}
