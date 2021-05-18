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
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(currName)
    setTitleLabelConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set(rate: Rate) {
    currName.text = rate.name
  }

  func setTitleLabelConstraints() {
    currName.translatesAutoresizingMaskIntoConstraints = false
    currName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    currName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
    currName.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
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
