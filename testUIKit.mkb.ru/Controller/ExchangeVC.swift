//
//  ExchangeVC.swift
//  testUIKit.mkb.ru
//
//  Created by Михаил Егоров on 15.05.2021.
//

import UIKit

class ExchangeVC: UIViewController {
    
    //    MARK: - PROPERTIES
    var exchangeTableView = UITableView()
    var dotLoad = DotLoadView()
    
    var dateLabel = UILabel()
    var exchangeRates: ExchangeRates?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureDateLabel()
        configureTableView()
        exchangeTableView.rowHeight = 48
        configureDotLoad()
        
        NetworkService().postRequest() { [weak self] exchangeRates, isError in
            self?.dotLoad.removeFromSuperview()
            if !isError {
                self?.exchangeRates = exchangeRates
                self?.dateLabel.text = exchangeRates?.ratesDate
                self?.exchangeTableView.reloadData()
            }
        }
    }
    
    //    MARK: - configureDateLabel
    func configureDateLabel() {
        view.addSubview(dateLabel)
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont(name: "avenir", size: 17)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    //    MARK: - configureTableView
    func configureTableView() {
        view.addSubview(exchangeTableView)
        exchangeTableView.delegate = self
        exchangeTableView.dataSource = self
        exchangeTableView.register(ExchangeCell.self, forCellReuseIdentifier: "ExchangeCell")
        exchangeTableView.translatesAutoresizingMaskIntoConstraints = false
        exchangeTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        exchangeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        exchangeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        exchangeTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    //    MARK: - configureDotLoad
    func configureDotLoad() {
        view.addSubview(dotLoad)
        dotLoad.translatesAutoresizingMaskIntoConstraints = false
        dotLoad.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotLoad.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

//    MARK: - UITableViewDataSource
extension ExchangeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exchangeRates?.rates.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = exchangeTableView.dequeueReusableCell(withIdentifier: "ExchangeCell", for: indexPath) as! ExchangeCell
        let currRow = exchangeRates?.rates[indexPath.row]
        cell.set(rate: currRow!)
        return cell
    }
}

//    MARK: - UITableViewDelegate
extension ExchangeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTrail = exchangeRates?.rates[indexPath.row]
        let vc = BuySaleVC()
        vc.curr = selectedTrail
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
}

// MARK: - PREVIEW
import SwiftUI

struct ExchangeVC_Provider: PreviewProvider {
    static var previews: some View {
        ContentView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContentView: UIViewControllerRepresentable {
        var tabBar = ExchangeVC()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ExchangeVC_Provider.ContentView>) -> UIViewController {
            return tabBar
        }
        
        func updateUIViewController(_ uiViewController: ExchangeVC_Provider.ContentView.UIViewControllerType, context: UIViewControllerRepresentableContext<ExchangeVC_Provider.ContentView>) {
        }
    } 
}
