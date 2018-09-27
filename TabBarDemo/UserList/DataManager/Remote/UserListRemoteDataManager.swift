//
//  UserListRemoteDataManager.swift
//  TabBarDemo
//
//  Created by Admin on 9/27/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import Moya
class UserListRemoteDataManager:UserDataListRemoteDataManagerInputProtocol {
    var remoteRequestHandler: UserDataListRemoteDataManagerOutputProtocol?
    
    func retrieveUserDataList() {
        let provider = MoyaProvider<UserNetworkManager>()
        var userList = Array<User>()
        provider.request(.users) { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    userList = try response.map(Array<User>.self);
                    self?.remoteRequestHandler?.onUsersRetrieved(userList)
                } catch {
                    print("Error info: \(error)")
                    
                }
            case .failure:
                print(".failure")
            }
        }
    }
    
}
