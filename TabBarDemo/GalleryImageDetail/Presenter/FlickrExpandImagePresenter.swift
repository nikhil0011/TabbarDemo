//
//  FlickrExpandImagePresenter.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation

class FlickrExpandImagePresenter: FlickrExpandImagePresenterProtocol {
    var postData: Post?
    var wireFrame: FlickrExpandImageWireFrameProtocol?
    weak var view: FlickrExpandImageViewProtocol?
    
    func viewDidLoad() {
        if let data = postData{
            view?.showPost(with: data)
        }
    }
}
