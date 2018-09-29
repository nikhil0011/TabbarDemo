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
        debugPrint("ProjectOverviewWireFrame")
        let view = ProjectOverviewTableViewController()
        let presenter: ProjectOverviewPresenterProtocol = ProjectOverviewPresenter()
        let wireFrame: ProjectOverviewWireFrameProtocol = ProjectOverviewWireFrame()
        
        view.presenter = presenter
        presenter.topicsData = returnTopicsData()
        presenter.view = view
        presenter.wireFrame = wireFrame
        return view
    }
    
    fileprivate static func returnTopicsData() -> Array<Topics>{
        var topics = Array<Topics>()
        topics.append(Topics(title: "Moya", description: "The Networking Library The Networking LibraryThe Networking LibraryThe Networking LibraryThe Networking Library"))
        topics.append(Topics(title: "Alamofire Image", description: "Load and Cache Image Asynchronously In app"))
        topics.append(Topics(title: "VIPER", description: "Code Distribution Intrnal Project Architechture"))
        topics.append(Topics(title: "Codeable and Decodable", description: "To Parse JOSN Response in App"))
        return topics
    }
}
