//
//  ProjectOverviewPresenter.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation

class ProjectOverviewPresenter: ProjectOverviewPresenterProtocol {
    var topicsData: Array<Topics>?
    var wireFrame: ProjectOverviewWireFrameProtocol?
    weak var view: ProjectOverviewViewProtocol?
    
    func viewDidLoad() {
        if let data = topicsData{
            view?.showTopics(with: data)
        }
    }
}
