//
//  ViewController.swift
//  HackerNewsMVVM
//
//  Created by Ivo Silva on 10/01/2017.
//  Copyright © 2017 Ivo Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let viewModel: NewsViewModel
    
    private lazy var tableView: UITableView = ViewController.newTableView()
    
    required init?(coder aDecoder: NSCoder) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.viewModel = appDelegate.initialViewModel
        
        super.init(coder: aDecoder)
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        
        tableView.backgroundColor = UIColor(red: 246/255, green: 245/255, blue: 240/255, alpha: 255)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        /// Closure used to deal with the state changes
        viewModel.stateChangeHandler = { [unowned self] change in
            switch change {
            case .none:
                break
            case .fetchStateChanged:
                break
            case .newsChanged:
                DispatchQueue.main.async { self.tableView.reloadData() }
            }
        }
        
        /// Order the view model to fetch the news
        viewModel.fetchNews()
    }

    /**
     Initialise and configure a new table view
     */
    private static func newTableView() -> UITableView {
        let tableView: UITableView = UITableView()
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        return tableView
    }
}

/**
 This UITableViewDataSource is placed in the ViewController and not on the ViewModel
 due to the fact that its methods posess references to the table view itself, which is
 a UI component.
 */
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")
        
        guard let tableViewCell = cell as? TableViewCell else {
            return UITableViewCell()
        }
        
        tableViewCell.configure(title: viewModel.articles?[indexPath.row].title, user: "Teixeira", score: "12")

        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

