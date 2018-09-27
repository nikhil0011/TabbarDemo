//
//  ViewController.swift
//  TabBarDemo
//
//  Created by Admin on 9/26/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit
import Moya

class UserViewController: UITableViewController {
    
    var userList = Dictionary<Int, Array<User>>()
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
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        tableView.allowsSelection = true
    }
}

extension UserViewController: UserListViewProtocol {
    func showUsers(with users: Dictionary<Int, Array<User>>) {
        userList = users
        tableView.reloadData()
    }

    func showError() {
        //Show Error Loader
    }

    func showLoading() {
        //Show Loader
    }

    func hideLoading() {
        //Hide Loader
    }
}

extension UserViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UserTableViewCell
        
        let keyValue = dictionaryKeys[indexPath.row]
        if let user  = userList[keyValue]{
            /*
             *MARK:- (user.first) As all elements in array shares same userId value
             */
            cell.set(forUser: user.first!)
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let keyValue = dictionaryKeys[indexPath.row]
        if let user  = userList[keyValue]{
            presenter?.showUserDetail(forUser: user)
        }
    }
}

