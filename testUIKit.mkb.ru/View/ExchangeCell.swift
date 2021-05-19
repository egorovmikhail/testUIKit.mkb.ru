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
        addSubview(currName)
        setTitleLabelConstraints()
        setFromTo()
        setsale()
        setbuy()
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
    
    func setTitleLabelConstraints() {
        addSubview(currName)
        currName.numberOfLines = 2
        currName.translatesAutoresizingMaskIntoConstraints = false
        currName.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        currName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        currName.widthAnchor.constraint(equalToConstant: contentView.bounds.width - 100).isActive = true
    }
    
    func setFromTo() {
        addSubview(fromTo)
        fromTo.translatesAutoresizingMaskIntoConstraints = false
        fromTo.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        fromTo.widthAnchor.constraint(equalToConstant: 100).isActive = true
        fromTo.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func setsale() {
        addSubview(sale)
        sale.textColor = .red
        sale.translatesAutoresizingMaskIntoConstraints = false
        sale.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        sale.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        sale.widthAnchor.constraint(equalToConstant: bounds.width / 2).isActive = true
    }
    
    func setbuy() {
        addSubview(buy)
        buy.textColor = .blue
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
