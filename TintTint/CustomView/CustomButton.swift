//
//  CustomButton.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import Foundation
import UIKit

class CustomButton: UIButton{
    
    var action: (()->())? = nil
    
    convenience init(title:String,titleColor: UIColor){
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
