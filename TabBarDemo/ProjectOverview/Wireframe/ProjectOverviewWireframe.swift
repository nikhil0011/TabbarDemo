//
//  ProjectOverviewWireframe.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit

class ProjectOverviewWireFrame: ProjectOverviewWireFrameProtocol {
    static func createProjectOverviewModule() -> UIViewController {
        let view = ProjectOverviewTableViewController()
        let presenter: ProjectOverviewPresenterProtocol & ProjectOverviewInteractorOutputProtocol = ProjectOverviewPresenter()
        let wireFrame: ProjectOverviewWireFrameProtocol = ProjectOverviewWireFrame()
        
        let interactor: ProjectOverviewInteractorInputProtocol & ProjectDataOverviewLocalDataManagerOutputProtocol = ProjectOverviewInteractor()
        let remoteDataManager: ProjectDataOverviewLocalDataManagerInputProtocol = ProjectOverviewLocalDataManager()

        view.presenter = presenter
        presenter.topicsData = [Topics]()
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor

        return view
    }
    
    
}
