//
//  FlickrWireFrame.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit

class FlickrWireFrame: FlickrGridWireFrameProtocol {
    
    
    static func createFlickrGridModule() -> UIViewController {
        let view = FlickrCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let presenter: FlickrGridPresenterProtocol & FlickrGridInteractorOutputProtocol = FlickrGridPresenter()
        let interactor: FlickrGridInteractorInputProtocol & FlickDataGridRemoteDataManagerOutputProtocol = FlickrGridInteractor()
        let remoteDataManager: FlickDataGridRemoteDataManagerInputProtocol = FlickrPostsRemoteDataManager()
        let wireFrame: FlickrGridWireFrameProtocol = FlickrWireFrame()
        
        view.presenter = presenter
        presenter.view = view 
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return view
    }
 }
