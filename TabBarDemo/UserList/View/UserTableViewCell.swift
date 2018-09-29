//
//  UserTableViewCell.swift
//  TabBarDemo
//
//  Created by Admin on 9/26/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    let userName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(userName)
        let constraints = [self.userName.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
        self.userName.bottomAnchor.constraint(equalTo: bottomAnchor , constant: -8.0),
        self.userName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
        self.userName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0)]
        /*
         *MARK:- Activating NSLayout Constraint
         */
        NSLayoutConstraint.activate(constraints)
    }
    
    func set(forUser user: User) {
        self.selectionStyle = .none
        userName.text = "User Name: \(user.userId)"
    }
}   
