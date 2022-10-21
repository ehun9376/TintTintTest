//
//  ViewController.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import UIKit
import Alamofire

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupCenterButton()
    }
    
    func setupCenterButton(){
        let button = CustomButton(title: "ReusetAPI", titleColor: .blue, buttonAction: {

            let vc = SecondViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        })
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true

    }


}

