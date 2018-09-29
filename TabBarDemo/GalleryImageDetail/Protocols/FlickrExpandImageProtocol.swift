//
//  FlickrExpandImageProtocol.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import UIKit

protocol FlickrExpandImagePresenterProtocol: class {
    var view: FlickrExpandImageViewProtocol? { get set }
    var wireFrame: FlickrExpandImageWireFrameProtocol? { get set }
    var postData: Post? { get set}
    // VIEW -> PRESENTER
    func viewDidLoad()
}

protocol FlickrExpandImageViewProtocol: class {
    var presenter: FlickrExpandImagePresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showPost(with post: Post)
    
}

protocol FlickrExpandImageWireFrameProtocol: class {
    static func createFlickrExpandImageModule(posts: Post) -> UIViewController
}


