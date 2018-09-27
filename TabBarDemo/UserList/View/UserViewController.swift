//
//  ViewController.swift
//  TabBarDemo
//
//  Created by Admin on 9/26/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit
import Moya
import PKHUD

class UserViewController: UITableViewController {
    
    var userList: [Int: User] = [:]
    let cellIdentifier = "userTableViewCell"
    var presenter: UserListPresenterProtocol?
    var dictionaryKeys: Array<Int> {
        get{
            return userList.keys.sorted()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func setupTableView(){
        self.navigationItem.title = "Users"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 246, green: 246, blue: 246)
        self.navigationController?.navigationBar.titleTextAttributes   = [NSAttributedStringKey.foregroundColor: UIColor.black]
        /**
         *MARK:- Tableview Setup and Configuration
         */
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        tableView.allowsSelection = false
    }
}

extension UserViewController: UserListViewProtocol {
    func showUsers(with users: [Int: User]) {
        userList = users
        debugPrint("UserViewController UserListViewProtocol",users.count)
        tableView.reloadData()
    }

    func showError() {
//        HUD.flash(.label("Currently, Unavailable Please Try Again"), delay: 2.0)
    }

    func showLoading() {
//        HUD.show(.progress)
    }

    func hideLoading() {
//        HUD.hide()
    }
}

extension UserViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UserTableViewCell
        
        let keyValue = dictionaryKeys[indexPath.row]
        if let user  = userList[keyValue]{
            cell.set(forUser: user)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debugPrint("User List",userList.count)
        return userList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let keyValue = dictionaryKeys[indexPath.row]
        if let user  = userList[keyValue]{
            presenter?.showUserDetail(forUser: user)
        }
    }
}

