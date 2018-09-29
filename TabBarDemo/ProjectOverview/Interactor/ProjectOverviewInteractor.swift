//
//  ProjectOverviewInteractor.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation

class ProjectOverviewInteractor: ProjectOverviewInteractorInputProtocol {
    var remoteDatamanager: ProjectDataOverviewLocalDataManagerInputProtocol?
    weak var presenter: ProjectOverviewInteractorOutputProtocol?

    func retrieveProjectOverview() {
        debugPrint("ProjectOverviewInteractor")
        remoteDatamanager?.retrieveProjectOverviewList()
    }

}

extension ProjectOverviewInteractor: ProjectDataOverviewLocalDataManagerOutputProtocol {
    func onProjectsRetrieved(_ topic: [Topics]) {
        presenter?.didRetrieveUsers(topic)
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
