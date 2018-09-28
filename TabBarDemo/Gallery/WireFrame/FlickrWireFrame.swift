//
//  FlickrWireFrame.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit

class FlickrWireFrame: FlickrGridWireFrameProtocol {
    func presentPostDetailScreen(from view: FlickrGridViewProtocol, forPost post: Post) {
        debugPrint("User List View Wire frame ")
//        let detailVc = UserDetailWireFrame.createUserDetailModule(users: users)
//        if let sourceView = view as? UIViewController {
//            debugPrint("presentUserDetailScreen Inside if let")
//            sourceView.navigationController?.pushViewController(detailVc, animated: true)
//        }
    }
    
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
