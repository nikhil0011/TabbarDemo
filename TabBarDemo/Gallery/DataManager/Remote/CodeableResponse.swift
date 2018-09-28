//
//  CodeableResponse.swift
//  TabBarDemo
//
//  Created by Admin on 9/27/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//
import Foundation

struct FlickrResponse<T: Codable>: Codable {
    let photos: FlickrResults<T>
}

struct FlickrResults<T: Codable>: Codable {
    let photo: [T]
}
