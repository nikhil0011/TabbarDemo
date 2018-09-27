//
//  UserNetworkManager.swift
//  TabBarDemo
//
//  Created by Admin on 9/27/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import Moya

public enum UserNetworkManager {
    static private let privateKey = "YOUR PRIVATE KEY"
    static private let publicKey = "YOUR PUBLIC KEY"
    
    case users
}

extension UserNetworkManager: TargetType {
    public var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    public var path: String {
        switch self {
        case .users: return "/posts"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .users: return .get
        }
    }
    
    public var sampleData: Data {
        /*
         *MARK:- sampleData is used to provide a mocked/stubbed version of your API for testing. In your case, you might want to return a fake response with just one or two comics. When creating unit tests, Moya can return this “fake” response to you instead of reaching out to the network. As I won’t be doing unit tests for this project, you return an empty Data object.
         */
        return Data()
    }
    
    public var task: Task {        
        switch self {
        case .users:
            return .requestParameters(parameters: [:],                                      encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}

