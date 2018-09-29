//
//  UserListInteractor.swift
//  TabBarDemo
//
//  Created by Admin on 9/27/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation

class UserListInteractor: UserListInteractorInputProtocol {
    weak var presenter: UserListInteractorOutputProtocol?
    var remoteDatamanager: UserDataListRemoteDataManagerInputProtocol?
    
    func retrieveUserList() {
        debugPrint("UserListInteractor")
        remoteDatamanager?.retrieveUserDataList()
    }
}

extension UserListInteractor: UserDataListRemoteDataManagerOutputProtocol {
    
    func onUsersRetrieved(_ users: [User]) {
        let dict = reduceArrayToDictionary(users: users)
        presenter?.didRetrieveUsers(dict)
    }
    
    fileprivate func reduceArrayToDictionary(users: [User]) -> Dictionary<Int, Array<User>>{
        var userDict = Dictionary<Int, Array<User>>()
        for user in users{
            let filter = users.filter{$0.userId == user.userId}
            userDict[user.userId] = filter
        }
//        
//        debugPrint("userDict.count",userDict.count)
//        debugPrint("userDict",userDict)
        return userDict
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
