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
    
    var horizantalBarLeftConstraint: NSLayoutConstraint?
   
    
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
        
        let selectedIndexPath = NSIndexPath(forItem: 0, inSection: 0)
        self.collectionView.selectItemAtIndexPath(selectedIndexPath, animated: false, scrollPosition: .None)
        
        //setting up white color bar on menu
        setUpHorizantalBar()
    }
    
    func setUpHorizantalBar(){
        let horizantalBar = UIView()
        horizantalBar.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        horizantalBar.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(horizantalBar)
        
        horizantalBarLeftConstraint = horizantalBar.leftAnchor.constraintEqualToAnchor(self.leftAnchor)
        horizantalBarLeftConstraint?.active = true
        
        horizantalBar.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
        horizantalBar.widthAnchor.constraintEqualToAnchor(self.widthAnchor, multiplier: 1/4).active = true
        horizantalBar.heightAnchor.constraintEqualToConstant(8).active = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! MenuCell
        cell.imageview.image = UIImage(named: cellItems[indexPath.row])?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        cell.tintColor = UIColor.rgbColor(91, green: 14, blue: 13)

        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let x = (CGFloat(indexPath.item) * frame.width) / 4
        horizantalBarLeftConstraint?.constant = x
        
        
        UIView.animateWithDuration(0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseOut, animations: { 
            self.layoutIfNeeded()
            }, completion: nil)
        
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
