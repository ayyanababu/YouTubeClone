//
//  MenuBar.swift
//  YouTubeClone
//
//  Created by Raja Ayyan on 19/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    let cellId = "cellid"
    
    let cellItems = ["home","trending","subscriptions","account"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionview = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionview.backgroundColor = UIColor.rgbColor(230, green: 32, blue: 31)
        collectionview.delegate = self
        collectionview.dataSource = self
        return collectionview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.registerClass(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        self.addSubview(collectionView)
        addConstraintsWithFormats("H:|[v0]|", views: collectionView)
        addConstraintsWithFormats("V:|[v0]|", views: collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! MenuCell
        cell.imageview.image = UIImage(named: cellItems[indexPath.row])
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(frame.width / 4, frame.height)
    }
    
  
}
