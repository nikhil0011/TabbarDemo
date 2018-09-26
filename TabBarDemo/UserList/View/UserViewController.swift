//
//  ViewController.swift
//  TabBarDemo
//
//  Created by Admin on 9/26/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit
import Moya
//import PKHUD

class UserViewController: UITableViewController {
    
    let user1 = User(id: 0,title: "iOS Developer")
    let user2 = User(id: 1,title: "Android Developer")
    let user3 = User(id: 2,title: "Web Developer")
    let user4 = User(id: 3,title: "Backend Developer")
    let user5 = User(id: 4,title: "Tester")

    var userList: [User] = []
    let cellIdentifier = "userTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        //        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
        userList.append(user1)
        userList.append(user2)
        userList.append(user3)
        userList.append(user4)
        userList.append(user5)
    }
    
    fileprivate func setupTableView(){
        self.navigationItem.title = "Comments"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 246, green: 246, blue: 246)
        self.navigationController?.navigationBar.titleTextAttributes   = [NSAttributedStringKey.foregroundColor: UIColor.black]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        tableView.allowsSelection = false
    }
    
}

//extension PostListView: PostListViewProtocol {
//
//    func showPosts(with posts: [PostModel]) {
//        postList = posts
//        tableView.reloadData()
//    }
//
//    func showError() {
//        HUD.flash(.label("Internet not connected"), delay: 2.0)
//    }
//
//    func showLoading() {
//        HUD.show(.progress)
//    }
//
//    func hideLoading() {
//        HUD.hide()
//    }
//}

extension UserViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UserTableViewCell
        
        let user = userList[indexPath.row]
        cell.set(forUser: user)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debugPrint("User List",userList.count)
        return userList.count
    }
    
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        presenter?.showPostDetail(forPost: postList[indexPath.row])
    //    }
    
}

