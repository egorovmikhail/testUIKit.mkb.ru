//
//  EndPointType.swift
//  testUIKit.mkb.ru
//
//  Created by Михаил Егоров on 22.06.2021.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }    
}
