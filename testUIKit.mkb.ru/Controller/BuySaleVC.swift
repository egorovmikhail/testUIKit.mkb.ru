//
//  BuySaleVC.swift
//  testUIKit.mkb.ru
//
//  Created by Михаил Егоров on 16.05.2021.
//

import UIKit

class BuySaleVC: UIViewController {
    
    //    MARK: - PROPERTIES
    var curr: Rate?
    
    var nameLabel = UILabel()
    var fromLabel = UILabel()
    var currMnemFromLabel = UILabel()
    var toLabel = UILabel()
    var currMnemToLabel = UILabel()
    var basicLabel = UILabel()
    var buyLabel = UILabel()
    var saleLabel = UILabel()
    var deltaBuyLabel = UILabel()
    var deltaSaleLabel = UILabel()
    
    //  MARK: - backButton
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.addTarget(self, action: #selector(back), for: .touchDown)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setConstraint()
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    func setView() {
        view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = .systemBackground
    }
    
    func setBackButtonConstraints() {
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    func setLabel(label: UILabel, nameLabel: String, text: String, addViev: UIView, const: CGFloat = 30) {
        label.translatesAutoresizingMaskIntoConstraints = false
        var textLabel: String = nameLabel
        textLabel += text
        label.text = textLabel
        addViev.addSubview(label)
        label.topAnchor.constraint(equalTo: addViev.topAnchor, constant: const).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
    }
    
    func setConstraint() {
        setBackButtonConstraints()
        setLabel(label: nameLabel, nameLabel: "name: ", text: curr!.name, addViev: view, const: 90)
        setLabel(label: fromLabel, nameLabel: "from: ", text: String(curr!.from), addViev: nameLabel)
        setLabel(label: currMnemFromLabel, nameLabel: "currMnemFrom: ", text: curr!.currMnemFrom, addViev: fromLabel)
        setLabel(label: toLabel, nameLabel: "to: ", text: String(curr!.to), addViev: currMnemFromLabel)
        setLabel(label: currMnemToLabel, nameLabel: "currMnemTo: ", text: curr!.currMnemTo, addViev: toLabel)
        setLabel(label: basicLabel, nameLabel: "basic: ", text: curr!.basic, addViev: currMnemToLabel)
        setLabel(label: buyLabel, nameLabel: "buy: ", text: curr!.buy, addViev: basicLabel)
        setLabel(label: saleLabel, nameLabel: "sale: ", text: curr!.sale, addViev: buyLabel)
        setLabel(label: deltaBuyLabel, nameLabel: "deltaBuy: ", text: curr!.deltaBuy, addViev: saleLabel)
        setLabel(label: deltaSaleLabel, nameLabel: "deltaSale: ", text: curr!.deltaSale, addViev: deltaBuyLabel)
    }
}


// MARK: - PREVIEW
import SwiftUI

struct BuySaleVC_Provider: PreviewProvider {
    static var previews: some View {
        ContentView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContentView: UIViewControllerRepresentable {
        var tabBar = ExchangeVC()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<BuySaleVC_Provider.ContentView>) -> UIViewController {
            return tabBar
        }
        
        func updateUIViewController(_ uiViewController: BuySaleVC_Provider.ContentView.UIViewControllerType, context: UIViewControllerRepresentableContext<BuySaleVC_Provider.ContentView>) {
        }
    }
}
