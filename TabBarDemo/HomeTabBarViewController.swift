//
//  HomeTabBarViewController.swift
//  Homingos
//
//  Created by Admin on 9/26/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit

class HomeTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userVc = UserViewController()
        userVc.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        userVc.title = "Users"
        userVc.view.backgroundColor = .white
        
        let galleryVc = GalleryViewController()
        galleryVc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        galleryVc.title = "Gallery"
        galleryVc.view.backgroundColor = .blue
        
        let infoVc = InfoViewController()
        infoVc.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        infoVc.title = "Info"
        infoVc.view.backgroundColor = .red
        
        let tabBarList = [userVc, galleryVc,infoVc]
        
        //        viewControllers = tabBarList
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0)}
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
