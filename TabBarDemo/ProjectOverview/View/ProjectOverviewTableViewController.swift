//
//  ProjectOverviewTableViewController.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit
private let reuseIdentifier = "overviewCell"

class ProjectOverviewTableViewController: UITableViewController {
    var presenter: ProjectOverviewPresenterProtocol?
    var dataList =  Array<Topics>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func setupTableView(){
        self.navigationItem.title = "Project Overview"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 246, green: 246, blue: 246)
        self.navigationController?.navigationBar.titleTextAttributes   = [NSAttributedStringKey.foregroundColor: UIColor.black]
        /**
         *MARK:- Tableview Setup and Configuration
         */
        tableView.register(ProjectOverviewTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        tableView.allowsSelection = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ProjectOverviewTableViewController: ProjectOverviewViewProtocol{
    func showTopics(with topics: Array<Topics>) {
        dataList = topics
        self.tableView.reloadData()
    }
}


extension ProjectOverviewTableViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProjectOverviewTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ProjectOverviewTableViewCell
        cell.set(forTopic: dataList[indexPath.row])
        return cell
    }
}
