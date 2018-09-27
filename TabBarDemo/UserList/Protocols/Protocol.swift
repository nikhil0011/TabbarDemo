//
//  Protocol.swift
//  TabBarDemo
//
//  Created by Admin on 9/27/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import UIKit

protocol UserListPresenterProtocol: class {
    var view: UserListViewProtocol? { get set }
    var interactor: UserListInteractorInputProtocol? { get set }
    var wireFrame: UserListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showUserDetail(forUser user: Array<User>)
}


protocol UserListViewProtocol: class {
    var presenter: UserListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showUsers(with users: Dictionary<Int, Array<User>>)
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol UserListInteractorInputProtocol: class {
        var presenter: UserListInteractorOutputProtocol? { get set }
        var remoteDatamanager: UserDataListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveUserList()
}


protocol UserListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveUsers(_ users: Dictionary<Int, Array<User>>)
    func onError()
}

protocol UserListWireFrameProtocol: class {
    static func createUserListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentUserDetailScreen(from view: UserListViewProtocol, forUser users: Array<User>)
}

protocol UserDataListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: UserDataListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveUserDataList()
}


protocol UserDataListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onUsersRetrieved(_ users: [User])
    func onError()
}



