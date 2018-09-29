//
//  ProjectOverviewProtocols.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import UIKit

protocol ProjectOverviewPresenterProtocol: class {
    var view: ProjectOverviewViewProtocol? { get set }
    var wireFrame: ProjectOverviewWireFrameProtocol? { get set }
    var topicsData: Array<Topics>? { get set}
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}

protocol ProjectOverviewViewProtocol: class {
    var presenter: ProjectOverviewPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showTopics(with topics: Array<Topics>)
    
}

protocol ProjectOverviewWireFrameProtocol: class {
    static func createProjectOverviewModule() -> UIViewController
}
