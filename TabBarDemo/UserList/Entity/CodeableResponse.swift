//
//  CodeableResponse.swift
//  TabBarDemo
//
//  Created by Admin on 9/27/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import Foundation

struct UserResponse<T: Codable>: Codable {
    let results: [T]
}
