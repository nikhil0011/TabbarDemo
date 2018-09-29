//
//  GalleryCollectionViewController.swift
//  TabBarDemo
//
//  Created by Admin on 9/28/18.
//  Copyright © 2018 DemoApp. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FlickrCollectionViewController: UICollectionViewController {
    var presenter: FlickrGridPresenterProtocol?
    var flickrPosts = Array<Post>()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        navigationItem.title = "Flicker Feed"
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 246, green: 246, blue: 246)
        self.navigationController?.navigationBar.titleTextAttributes   = [NSAttributedStringKey.foregroundColor: UIColor.black]

        self.collectionView!.register(FlickrCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        presenter?.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var tempImageview: UIImageView?
    let blackBackground = UIView()
    var cellImageView = UIImageView()
    let navbarCoverView = UIView()
    let tabbarCoverView = UIView()

    func animateImageView(imageView: UIImageView){
        self.tempImageview = imageView
        
        self.blackBackground.frame = view.frame
        self.blackBackground.backgroundColor = .black
        self.blackBackground.alpha = 0
        view.addSubview(self.blackBackground)
        
        /*
         *Setting up nav bar black cover
         */
        if let navController = self.navigationController{
            navbarCoverView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: navController.navigationBar.frame.height + 20)
        }else{
            navbarCoverView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44.0 + 20.0)
        }
        navbarCoverView.backgroundColor = .black
        navbarCoverView.alpha = 0
        /*
         *We can use add subview to add subview on to view
         but above it on nav controller it's to be done via key window 
         */
        if let keywindow = UIApplication.shared.keyWindow{
            keywindow.addSubview(navbarCoverView)
//            let heightOfTabbar = self.tabBarItem.accessibilityFrame.height
            let heightOfTabbar = 49.0

            tabbarCoverView.frame = CGRect(x: 0, y: keywindow.frame.height - 49 , width: keywindow.frame.width, height: 49)
            tabbarCoverView.backgroundColor = .black
            tabbarCoverView.alpha = 0
            keywindow.addSubview(tabbarCoverView)
        }
        
        if let startFrame = imageView.superview?.convert(imageView.frame, to: nil){
            
            cellImageView.frame = startFrame
            cellImageView.image = imageView.image
            cellImageView.isUserInteractionEnabled = true
            cellImageView.contentMode = .scaleAspectFill
            view.addSubview(cellImageView)
            
            cellImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomOutImageview)))
            
            let newHeight = self.view.frame.width * startFrame.height / self.view.frame.width
            let y = self.view.frame.height / 2 - newHeight/2
            
            UIView.animate(withDuration: 0.75, delay: 0, options: .curveEaseOut, animations: {
                self.cellImageView.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: newHeight)
                self.blackBackground.alpha = 1
                self.navbarCoverView.alpha = 1
                self.tabbarCoverView.alpha = 1
            }, completion: nil)
        }
    }
    
    @objc fileprivate func zoomOutImageview(){
        if let startFrame = tempImageview?.superview?.convert((tempImageview?.frame)!, to: nil){
            UIView.animate(withDuration: 0.75, animations: {
                self.cellImageView.frame = startFrame
                self.blackBackground.alpha = 0
                self.navbarCoverView.alpha = 0
                self.tabbarCoverView.alpha = 0
            }, completion: {(didComplete) -> Void in
                self.cellImageView.removeFromSuperview()
                self.blackBackground.removeFromSuperview()
                self.navbarCoverView.removeFromSuperview()
                self.tabbarCoverView.removeFromSuperview()
                self.tempImageview?.alpha = 1
            })
            }
        }
    }

extension FlickrCollectionViewController: FlickrGridViewProtocol {
    func showPosts(with posts: Array<Post>) {
        flickrPosts = posts
        collectionView?.reloadData()
    }
    
    func showError() {
        //Show Error Loader
    }
    
    func showLoading() {
        //Show Loader
    }
    
    func hideLoading() {
        //Hide Loader
    }
}

extension FlickrCollectionViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  16
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
}

extension FlickrCollectionViewController{
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return flickrPosts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FlickrCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FlickrCollectionViewCell
        let imageUrl = returnFlickrUrl(post: flickrPosts[indexPath.row])
        cell.flickrController = self
        cell.set(forPost: imageUrl)
        return cell
    }
    
    func returnFlickrUrl (post: Post) -> String{
        let url = "https://farm1.staticflickr.com/\(post.server)" + "/" + "\(post.id)_\(post.secret).jpg"
        return url
    }
    
//   override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let row = indexPath.row
//        let post = flickrPosts[row]
//        presenter?.showPostDetail(forPost: post)
//    }
}
