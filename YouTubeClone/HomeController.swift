//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Raja Ayyan on 18/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let menubar: MenuBar = {
        let menu = MenuBar()
        return menu
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.translucent = false
        
        let titleLabel = UILabel()
        titleLabel.frame = CGRectMake(0, 0, self.view.frame.size.width - 32, view.frame.size.height)
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(20)
        titleLabel.textAlignment = .Center
        navigationItem.titleView = titleLabel
        
        collectionView?.registerClass(VideoCell.self, forCellWithReuseIdentifier: "cellid")
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        
        
        self.setupMenuBar()
    }
    
    private func setupMenuBar(){
        self.view.addSubview(menubar)
        self.view.addConstraintsWithFormats("H:|[v0]|", views: menubar)
        self.view.addConstraintsWithFormats("V:|[v0(50)]", views: menubar)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellid", forIndexPath: indexPath)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let height = (self.view.frame.size.width - 15 - 15 ) * (9 / 16)
        return CGSizeMake(self.view.frame.width, height + 15 + 67)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }

}





