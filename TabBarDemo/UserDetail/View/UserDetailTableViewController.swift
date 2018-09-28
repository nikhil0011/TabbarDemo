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
    var selectedRowIndex = -1

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
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedRowIndex {
            let index = IndexPath(row: selectedRowIndex, section: 0)
            let cell: UserDetailTableViewCell = self.tableView.cellForRow(at: index) as! UserDetailTableViewCell
            cell.body.numberOfLines = 0
            cell.title.numberOfLines = 0

            let body = cell.body.text!
            let title = cell.title.text!

            let bodyHeight = body.height(withConstrainedWidth: cell.frame.width, font: UIFont.systemFont(ofSize: 14))
            let titleHeight = title.height(withConstrainedWidth: cell.frame.width, font: UIFont.systemFont(ofSize: 14))
            /*
             *MARK:- 32 is sum of constant value passed UserDetailTableViewCell components
             */
            return bodyHeight + titleHeight + 40
        }
        return 80
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedRowIndex != indexPath.row {
            // paint the last cell tapped to white again
            let index = IndexPath(row: selectedRowIndex, section: 0)
            self.tableView.cellForRow(at: index)?.backgroundColor = UIColor.white
            
            // save the selected index
            self.selectedRowIndex = indexPath.row
            
            // paint the selected cell to gray
            self.tableView.cellForRow(at: indexPath)?.backgroundColor = UIColor.rgb(red: 246, green: 246, blue: 246)
            
            // update the height for all the cells
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        }
        return
    }
}

