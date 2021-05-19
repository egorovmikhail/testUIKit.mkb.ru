//
//  ExchangeCell.swift
//  testUIKit.mkb.ru
//
//  Created by Михаил Егоров on 16.05.2021.
//

import UIKit

class ExchangeCell: UITableViewCell {
    
    //  MARK: - currName
    var currName = UILabel()
    var fromTo = UILabel()
    var sale = UILabel()
    var buy = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setFromTo()
        setCurrName()
        setbuy()
        setsale()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(rate: Rate) {
        currName.text = rate.name
        fromTo.text = rate.fromTo
        sale.text = rate.saleText
        buy.text = rate.buyText
    }
    
    func setFromTo() {
        addSubview(fromTo)
        fromTo.font = .boldSystemFont(ofSize: 24)
        fromTo.translatesAutoresizingMaskIntoConstraints = false
        fromTo.topAnchor.constraint(equalTo: topAnchor,constant: 15).isActive = true
        fromTo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        fromTo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
    }
    
    func setCurrName() {
        addSubview(currName)
        currName.numberOfLines = 2
        currName.textAlignment = .left
        currName.translatesAutoresizingMaskIntoConstraints = false
        currName.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        currName.leadingAnchor.constraint(equalTo: fromTo.trailingAnchor).isActive = true
        currName.widthAnchor.constraint(equalToConstant: contentView.bounds.width - 100).isActive = true
    }
    
    func setsale() {
        addSubview(sale)
        sale.textColor = .systemRed
        sale.font = UIFont(name: "arial", size: 14)
        sale.translatesAutoresizingMaskIntoConstraints = false
        sale.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        sale.trailingAnchor.constraint(equalTo: buy.leadingAnchor).isActive = true
        sale.widthAnchor.constraint(equalToConstant: bounds.width / 2).isActive = true
    }
    
    func setbuy() {
        addSubview(buy)
        buy.textColor = .systemBlue
        buy.font = UIFont(name: "arial", size: 14)
        buy.translatesAutoresizingMaskIntoConstraints = false
        buy.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        buy.widthAnchor.constraint(equalToConstant: bounds.width / 2).isActive = true
        buy.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    
}

// MARK: - PREVIEW
import SwiftUI

struct ExchangeCell_Provider: PreviewProvider {
    static var previews: some View {
        ContentView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContentView: UIViewControllerRepresentable {
        var tabBar = ExchangeVC()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ExchangeCell_Provider.ContentView>) -> UIViewController {
            return tabBar
        }
        
        func updateUIViewController(_ uiViewController: ExchangeCell_Provider.ContentView.UIViewControllerType, context: UIViewControllerRepresentableContext<ExchangeCell_Provider.ContentView>) {
        }
    }
}
