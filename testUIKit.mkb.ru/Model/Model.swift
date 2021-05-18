//
//  Model.swift
//  testUIKit.mkb.ru
//
//  Created by Михаил Егоров on 15.05.2021.
//

import Foundation

// MARK: - ExchangeRates
struct ExchangeRates: Codable {
    var code: Int
    var messageTitle: String
    var message: String
    var rid: String
    var downloadDate: String
    var rates: [Rate]
    var productState: Int
    var ratesDate: String
}

// MARK: - Rate
struct Rate: Codable {
    var tp: Int
    var name: String
    var from: Int
    var currMnemFrom: String
    var to: Int
    var currMnemTo: String
    var basic: String
    var buy: String
    var sale: String
    var deltaBuy: String
    var deltaSale: String
}
