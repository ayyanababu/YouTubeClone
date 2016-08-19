//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Raja Ayyan on 18/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        collectionView?.registerClass(VideoCell.self, forCellWithReuseIdentifier: "cellid")
        self.collectionView?.backgroundColor = UIColor.whiteColor()
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellid", forIndexPath: indexPath)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.view.frame.width, 200)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    

}


class VideoCell: UICollectionViewCell{
    
    let thumnailImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = UIColor.blueColor()
        imageview.image = UIImage(named:"taylor_swift_blank_space")
        return imageview
    }()
    
    let userProfileImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = UIColor.greenColor()
        return imageview
    }()
    
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blackColor()
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.purpleColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textview = UITextView()
        textview.backgroundColor = UIColor.redColor()
        textview.translatesAutoresizingMaskIntoConstraints = false
        return textview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpViews()
        //self.backgroundColor = UIColor.grayColor()
        
    }

    
    
    func setUpViews(){
        self.addSubview(thumnailImageView)
        self.addSubview(seperatorView)
        self.addSubview(userProfileImageView)
        self.addSubview(titleLabel)
        self.addSubview(subtitleTextView)

        
        addConstraintsWithFormats("H:|-15-[v0]-15-|", views: thumnailImageView)
        addConstraintsWithFormats("H:|-15-[v0(44)]", views: userProfileImageView)
        addConstraintsWithFormats("V:|-15-[v0]-8-[v1(44)]-15-[v2(1)]|", views: thumnailImageView, userProfileImageView,seperatorView)
        addConstraintsWithFormats("H:|[v0]|", views: seperatorView)

        //adding indidvidual constraints to title label
        //top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Top, relatedBy: .Equal, toItem: thumnailImageView, attribute: .Bottom, multiplier: 1, constant: 8))
        
        //left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Left, relatedBy: .Equal, toItem: userProfileImageView, attribute: .Right, multiplier: 1, constant: 8))
        
        
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Right, relatedBy: .Equal, toItem: thumnailImageView, attribute: .Right, multiplier: 1, constant: 0))
        
        //height consttaint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 20))
        
        //adding indidvidual constraints to subtitletextview
        //top constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Top, relatedBy: .Equal, toItem: titleLabel, attribute: .Bottom, multiplier: 1, constant: 8))
        
        //left constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Left, relatedBy: .Equal, toItem: userProfileImageView, attribute: .Right, multiplier: 1, constant: 8))
        
        
        //right constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Right, relatedBy: .Equal, toItem: titleLabel, attribute: .Right, multiplier: 1, constant: 0))
        
        //height consttaint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 20))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIView{
    func addConstraintsWithFormats(format: String, views: UIView...){
        
        var viewsDict = [String: UIView]()
        for (index, view) in views.enumerate(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDict[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }
}

