//
//  NetworkService.swift
//  testUIKit.mkb.ru
//
//  Created by Михаил Егоров on 15.05.2021.
//

import Foundation

class NetworkService {
  
  func postRequest(completion: @escaping (ExchangeRates?, Bool) -> Void) {
    
    guard let url = URL(string: "https://alpha.as50464.net:29870/moby-pre-44/core?r=BEYkZbmV&d=563B4852-6D4B-49D6-A86E-B273DD520FD2&t=ExchangeRates&v=44") else { return }
    
    let jsonBody = ["uid":"563B4852-6D4B-49D6-A86E-B273DD520FD2","type":"ExchangeRates","rid":"BEYkZbmV"]
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("Test GeekBrains iOS 3.0.0.182 (iPhone 11; iOS 14.4.1; Scale/2.00; Private)",
                     forHTTPHeaderField: "User-Agent")
    request.addValue("application/json",
                     forHTTPHeaderField: "Content-Type")
    request.addValue("Accept",
                     forHTTPHeaderField: "application")
    
    guard let httpBody = try? JSONSerialization.data(withJSONObject: jsonBody, options: []) else { return }
    request.httpBody = httpBody
    
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
      DispatchQueue.global().async {
        guard let data = data else { return }
        
        do {
          let exchangeRates = try JSONDecoder().decode(ExchangeRates.self, from: data)
          DispatchQueue.main.async {
            completion(exchangeRates, false)
          }
        } catch {
            completion(nil, true)
            print(error)  
        }
      }
    } .resume()
  }
}

