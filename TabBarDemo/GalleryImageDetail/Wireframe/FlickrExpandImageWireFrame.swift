//
//  FlickrExpandImageWireFrame.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit

class FlickrExpandImageWireFrame: FlickrExpandImageWireFrameProtocol {
    static func createFlickrExpandImageModule(posts: Post) -> UIViewController {
        debugPrint("FlickrExpandImageWireFrame")
        let view = FlickExpandImageViewController()
        let presenter: FlickrExpandImagePresenterProtocol = FlickrExpandImagePresenter()
        let wireFrame: FlickrExpandImageWireFrameProtocol = FlickrExpandImageWireFrame()
        
        view.presenter = presenter
        presenter.postData = posts
        presenter.view = view
        presenter.wireFrame = wireFrame
        return view
    }
    
}
