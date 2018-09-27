//
//  UserDetailTableViewController.swift
//  TabBarDemo
//
//  Created by Admin on 9/28/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit

class UserDetailTableViewController: UITableViewController {
    var dataList =  Array<User>()
    let cellIdentifier = "userDetailTableViewCell"
    var presenter: UserDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func setupTableView(){
        self.navigationItem.title = "Comments"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 246, green: 246, blue: 246)
        self.navigationController?.navigationBar.titleTextAttributes   = [NSAttributedStringKey.foregroundColor: UIColor.black]
        /**
         *MARK:- Tableview Setup and Configuration
         */
        tableView.register(UserDetailTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        tableView.allowsSelection = true
    }
}

extension UserDetailTableViewController: UserDetailViewProtocol {
    func showUsers(with users: Array<User>) {
        dataList = users
        tableView.reloadData()
    }
}

extension UserDetailTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UserDetailTableViewCell
        cell.set(forUser: dataList[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debugPrint("Couunt in Detial PAge",dataList.count)
        return dataList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}

