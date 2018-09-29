//
//  FlickrGridPresenter.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation

class FlickrGridPresenter: FlickrGridPresenterProtocol {
    var wireFrame: FlickrGridWireFrameProtocol?
    weak var view: FlickrGridViewProtocol?
    var interactor: FlickrGridInteractorInputProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrievePostsList()
    }
    
    func showPostDetail(forPost post: Post) {
        debugPrint("Show User Detial In Presenter")
        wireFrame?.presentPostDetailScreen(from: view!, forPost: post)
    }
}

extension FlickrGridPresenter: FlickrGridInteractorOutputProtocol {
    func didRetrievePosts(_ posts: [Post]) {
        view?.hideLoading()
        view?.showPosts(with: posts)

    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}


