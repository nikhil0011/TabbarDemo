//
//  UserDetailPresenter.swift
//  TabBarDemo
//
//  Created by Admin on 9/28/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation

class UserDetailPresenter: UserDetailPresenterProtocol {
    var wireFrame: UserDetailWireFrameProtocol?
    weak var view: UserDetailViewProtocol?
    var usersData: Array<User>?
    
    func viewDidLoad() {
        if let data = usersData{
            view?.showUsers(with: data)
        }
    }
}
