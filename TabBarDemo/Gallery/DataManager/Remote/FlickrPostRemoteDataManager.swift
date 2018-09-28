//
//  FlickrPostRemoteDataManager.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import Moya

class FlickrPostsRemoteDataManager:FlickDataGridRemoteDataManagerInputProtocol {
    var remoteRequestHandler: FlickDataGridRemoteDataManagerOutputProtocol?

    func retrievePostsDataList() {
        let provider = MoyaProvider<FlickrNetworkManager>()
        var flickrPosts = Array<Post>()
        provider.request(.flickrPosts) { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    flickrPosts = try response.map(FlickrResponse<Post>.self).photos.photo
                    self?.remoteRequestHandler?.onPostsDataRetrieved(flickrPosts)
                } catch {
                    print("Error info: \(error)")
                    
                }
            case .failure:
                print(".failure")
            }
        }
    }
}
