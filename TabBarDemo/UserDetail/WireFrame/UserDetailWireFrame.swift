//
//  UserDetailWireFrame.swift
//  TabBarDemo
//
//  Created by Admin on 9/28/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit

class UserDetailWireFrame: UserDetailWireFrameProtocol {
    static func createUserDetailModule(users: Array<User>) -> UIViewController {
        debugPrint("UserDetailWireFrame")
        let view = UserDetailTableViewController()
        let presenter: UserDetailPresenterProtocol = UserDetailPresenter()
        let wireFrame: UserDetailWireFrameProtocol = UserDetailWireFrame()
        
        view.presenter = presenter
        presenter.usersData = users
        presenter.view = view
        presenter.wireFrame = wireFrame
        return view
    }
    
    
}
