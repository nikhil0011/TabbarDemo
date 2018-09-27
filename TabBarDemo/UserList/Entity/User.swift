//
//  User.swift
//  TabBarDemo
//
//  Created by Admin on 9/26/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation
//import ObjectMapper

struct User : Codable {
    var id: Int
    var title: String
    var body: String
    var userId: Int
}

extension User: CustomDebugStringConvertible {
    var debugDescription: String {
        return "<User: \n \(id)\n> title:\n \(title)\n with body\n \(body)\n  and userId:\n \(userId)\n"
    }
}

