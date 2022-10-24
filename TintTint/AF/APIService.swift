//
//  APIService.swift
//  TintTint
//
//  Created by yihuang on 2022/10/20.
//

import Foundation
import Alamofire
import RxCocoa
import RxSwift

class AFAPIService {
    
    static let shared = AFAPIService()
    
    func downloadJsonWithUrl<T:JsonModel>(url:String,
                                          modelType:T.Type,
                                          handler: @escaping ((T)->())){
        let request = AF.request(url)
        request.response { data in
            if let data = data.data {
                let json = try? JSONSerialization.jsonObject(with: data)
                
                if let jsonArray = json as? [[String:Any]] {
                    handler(T(json: ["Array":jsonArray]))
                    return
                }
                
                if let json = json as? [String:Any] {
                    handler(T(json: json))
                    return
                }
            }
        }

    }
    
    func downloadImageWithUrl(url: String,
                              handler: ((UIImage)->())?){
        let request = AF.request(url)
        request.response { data in
            if let data = data.data,let image = UIImage(data: data),let handler = handler {
                handler(image)
            }
        }
    }

                    
}
