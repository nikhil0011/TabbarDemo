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
        let itemAtRow = flickrPosts[indexPath.row]
        let url = "https://farm1.staticflickr.com/\(itemAtRow.server)" + "/" + "\(itemAtRow.id)_\(itemAtRow.secret).jpg"
        cell.set(forPost: url)
        return cell
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
