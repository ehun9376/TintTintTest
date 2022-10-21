//
//  Extension.swift
//  TintTint
//
//  Created by yihuang on 2022/10/21.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
