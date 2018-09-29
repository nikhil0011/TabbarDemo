//
//  ProjectOverviewPresenter.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation

class ProjectOverviewPresenter: ProjectOverviewPresenterProtocol {
    var interactor: ProjectOverviewInteractorInputProtocol?
    var topicsData: Array<Topics>?
    var wireFrame: ProjectOverviewWireFrameProtocol?
    weak var view: ProjectOverviewViewProtocol?
    
    func viewDidLoad() {
        debugPrint("ProjectOverviewPresenter")
        interactor?.retrieveProjectOverview()
    }
}

extension ProjectOverviewPresenter: ProjectOverviewInteractorOutputProtocol {
    func didRetrieveUsers(_ topic:  [Topics]){
        debugPrint("ProjectOverviewPresenter didRetrieveUsers")
        view?.showTopics(with: topic)
    }
    func onError(){
    }
    
}
