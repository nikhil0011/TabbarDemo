//
//  FlickrGridProtocols.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import UIKit

protocol FlickrGridPresenterProtocol: class {
    var view: FlickrGridViewProtocol? { get set }
    var interactor: FlickrGridInteractorInputProtocol? { get set }
    var wireFrame: FlickrGridWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showPostDetail(forPost post: Post)
}


protocol FlickrGridViewProtocol: class {
    var presenter: FlickrGridPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showPosts(with posts: Array<Post>)
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol FlickrGridInteractorInputProtocol: class {
    var presenter: FlickrGridInteractorOutputProtocol? { get set }
    var remoteDatamanager: FlickDataGridRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrievePostsList()
}


protocol FlickrGridInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrievePosts(_ posts: [Post])
    func onError()
}

protocol FlickrGridWireFrameProtocol: class {
    static func createFlickrGridModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentPostDetailScreen(from view: FlickrGridViewProtocol, forPost post: Post)
}

protocol FlickDataGridRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: FlickDataGridRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrievePostsDataList()
}


protocol FlickDataGridRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onPostsDataRetrieved(_ post: [Post])
    func onError()
}



