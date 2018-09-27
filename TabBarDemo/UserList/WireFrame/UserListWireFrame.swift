//
//  UserListWireFrame.swift
//  TabBarDemo
//
//  Created by Admin on 9/27/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit

class UserListWireFrame: UserListWireFrameProtocol {
    static func createUserListModule() -> UIViewController {
        let view = UserViewController()
        let presenter: UserListPresenterProtocol & UserListInteractorOutputProtocol = UserListPresenter()
        let interactor: UserListInteractorInputProtocol & UserDataListRemoteDataManagerOutputProtocol = UserListInteractor()
        let remoteDataManager: UserDataListRemoteDataManagerInputProtocol = UserListRemoteDataManager()
        let wireFrame: UserListWireFrameProtocol = UserListWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return view
    }
    
    func presentUserDetailScreen(from view: UserListViewProtocol, forPost post: Array<User>) {
        
        return
    }
   
}
