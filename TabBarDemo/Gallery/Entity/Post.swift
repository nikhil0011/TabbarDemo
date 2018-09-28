//
//  Post.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation

struct Post : Codable {
    var id: Int
    var secret: String
    var server: String
    var title: String
}

extension Post: CustomDebugStringConvertible {
    var debugDescription: String {
        return "<id: \n \(id)\n> secret:\n \(secret)\n with server\n \(server)\n  and title:\n \(title)\n"
    }
}

