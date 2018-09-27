//
//  UserDetailProtocol.swift
//  TabBarDemo
//
//  Created by Admin on 9/28/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//


import Foundation
import UIKit

protocol UserDetailPresenterProtocol: class {
    var view: UserDetailViewProtocol? { get set }
    var wireFrame: UserDetailWireFrameProtocol? { get set }
    var usersData: Array<User>? { get set}
    // VIEW -> PRESENTER
    func viewDidLoad()
}

protocol UserDetailViewProtocol: class {
    var presenter: UserDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showUsers(with users: Array<User>)
   
}

protocol UserDetailWireFrameProtocol: class {
    static func createUserDetailModule(users: Array<User>) -> UIViewController
}

