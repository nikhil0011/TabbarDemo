//
//  FlickExpandImageViewController.swift
//  TabBarDemo
//
//  Created by Admin on 9/29/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit
import AlamofireImage

class FlickExpandImageViewController: UIViewController {
    var presenter: FlickrExpandImagePresenterProtocol?
    
    let selectedImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        self.navigationItem.title = "ZoomImageView"
        self.navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 246, green: 246, blue: 246)
        self.navigationController?.navigationBar.titleTextAttributes   = [NSAttributedStringKey.foregroundColor: UIColor.black]
        view.backgroundColor = .black
        
        selectedImage.contentMode  = .scaleAspectFill
        selectedImage.layer.masksToBounds = true
        selectedImage.isUserInteractionEnabled = true
        selectedImage.clipsToBounds = true
        let y = self.view.frame.height / 2 - self.selectedImage.frame.height
        selectedImage.frame = CGRect(x: 0 , y: y, width: self.view.frame.width, height: 300)
        self.view.addSubview(selectedImage)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension FlickExpandImageViewController: FlickrExpandImageViewProtocol{    
    
    func showPost(with post: Post) {
        let url = "https://farm1.staticflickr.com/\(post.server)" + "/" + "\(post.id)_\(post.secret).jpg"
        let imageUrl = URL(string: url)!
        let placeholderImage = UIImage(named: "placeholder")!
        selectedImage.af_setImage(withURL: imageUrl, placeholderImage: placeholderImage)
        DispatchQueue.main.async{
            self.setupView()
        }
    }
}
