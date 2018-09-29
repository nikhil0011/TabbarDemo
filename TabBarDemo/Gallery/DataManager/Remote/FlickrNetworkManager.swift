//
//  FlickrNetworkManager.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import Moya


public enum FlickrNetworkManager {
    static private let api_key = "e449b259146e14b0d55e770fb3577436"
    static private let api_method = "flickr.photos.getRecent"
    case flickrPosts
}

extension FlickrNetworkManager: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.flickr.com/services")!
    }
    
    public var path: String {
        switch self {
        case .flickrPosts: return "/rest"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .flickrPosts: return .get
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
        case .flickrPosts:
            return .requestParameters(parameters:
                ["method": FlickrNetworkManager.api_method,"api_key": FlickrNetworkManager.api_key,"format":"json","nojsoncallback":"1"],encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}

