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
    
    let selectedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode  = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        self.view.addSubview(selectedImage)
        let constraint = [
            selectedImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            selectedImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraint)
        
        self.navigationItem.title = "ZoomImageView"
        view.backgroundColor = .white
        animateImageview()
    }
    
    @objc func animateImageview(){
        
        let newHeight = self.selectedImage.frame.width * self.view.frame.height / self.view.frame.width
        //        let newHeight = (self.selectedImage.frame.width  / self.view.frame.width) * self.view.frame.height
        let y = self.view.frame.height / 2 - self.selectedImage.frame.height
        UIView.animate(withDuration: 02, animations: {
            self.selectedImage.frame = CGRect(x: 100, y: 900, width: self.view.frame.width, height: newHeight)
            //            self.selectedImage.backgroundColor = .yellow
            self.selectedImage.alpha = 0.6
        })
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
    }
}
