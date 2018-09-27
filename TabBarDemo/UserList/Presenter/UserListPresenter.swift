//
//  UserListPresenter.swift
//  TabBarDemo
//
//  Created by Admin on 9/26/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation

class UserListPresenter: UserListPresenterProtocol {
    var wireFrame: UserListWireFrameProtocol?    
    weak var view: UserListViewProtocol?
    var interactor: UserListInteractorInputProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveUserList()
    }
    
    func showUserDetail(forUser User: Array<User>) {
        wireFrame?.presentUserDetailScreen(from: view!, forPost: User)
    }    
}

extension UserListPresenter: UserListInteractorOutputProtocol {
    
    func didRetrieveUsers(_ Users: Dictionary<Int, Array<User>>) {
        view?.hideLoading()
        view?.showUsers(with: Users)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}


