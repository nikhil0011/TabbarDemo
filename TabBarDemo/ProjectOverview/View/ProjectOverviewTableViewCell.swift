//
//  ProjectOverviewTableViewCell.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit

class ProjectOverviewTableViewCell: UITableViewCell {
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let body: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
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
        addSubview(title)
        addSubview(body)
        let constraints = [self.title.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
                           self.title.bottomAnchor.constraint(equalTo: body.topAnchor , constant: -8.0),
                           self.title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
                           self.title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0),
                           self.body.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8.0),
                           self.body.bottomAnchor.constraint(equalTo: bottomAnchor , constant: -8.0),
                           self.body.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
                           self.body.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0)]
        /*
         *MARK:- Activating NSLayout Constraint
         */
        NSLayoutConstraint.activate(constraints)
    }
    
    func set(forTopic topic: Topics) {
        title.text = "\(topic.title)"
        body.text = "\(topic.description)"
    }
}
