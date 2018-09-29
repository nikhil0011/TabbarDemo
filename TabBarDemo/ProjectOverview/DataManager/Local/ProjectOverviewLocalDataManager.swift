
//
//  FlickrLocalDataManager.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
import Moya

class ProjectOverviewLocalDataManager: ProjectDataOverviewLocalDataManagerInputProtocol {
    var remoteRequestHandler: ProjectDataOverviewLocalDataManagerOutputProtocol?
    
    func retrieveProjectOverviewList() {
        let topics = self.returnTopicsData()
        self.remoteRequestHandler?.onProjectsRetrieved(topics)
    }

    fileprivate func returnTopicsData() -> [Topics]
    {
        var topics = Array<Topics>()
        topics.append(Topics(title: "Moya", description: "Moya is a networking library inspired by the concept of encapsulating network requests in type-safe way, typically using enumerations"))
        topics.append(Topics(title: "Alamofire Image", description: "AlamofireImage is an image component library for Alamofire. \nLoad and Cache Image Asynchronously In app"))
        topics.append(Topics(title: "VIPER", description: "VIPER is an application of Clean Architecture to iOS apps.\nThe word VIPER is a backronym for View, Interactor, Presenter, Entity, and Routing.\nClean Architecture divides an app's logical structure into distinct layers of responsibility."))
        topics.append(Topics(title: "Decodable & Encodable", description: "The Swift standard library defines a standardized approach to data encoding and decoding. You adopt this approach by implementing the Encodable and Decodable protocols on your custom types"))
        return topics
    }
    
}
