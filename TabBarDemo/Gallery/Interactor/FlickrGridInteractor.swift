//
//  FlickrGridInteractor\.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation

class FlickrGridInteractor: FlickrGridInteractorInputProtocol {
    weak var presenter: FlickrGridInteractorOutputProtocol?
    var remoteDatamanager: FlickDataGridRemoteDataManagerInputProtocol?

    func retrievePostsList() {
        debugPrint("FlickrGridInteractor")
        remoteDatamanager?.retrievePostsDataList()
    }
}

extension FlickrGridInteractor: FlickDataGridRemoteDataManagerOutputProtocol {
    func onPostsDataRetrieved(_ post: [Post]) {
        presenter?.didRetrievePosts(post)
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
