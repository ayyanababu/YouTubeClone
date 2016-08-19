//
//  VideoCell.swift
//  YouTubeClone
//
//  Created by Raja Ayyan on 19/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell{
    
    let thumnailImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = UIColor.blueColor()
        imageview.image = UIImage(named:"taylor_swift_blank_space")
        imageview.contentMode = .ScaleAspectFill
        imageview.clipsToBounds = true
        return imageview
    }()
    
    let userProfileImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "taylor_swift_profile")
        
        //rounded image
        imageview.layer.cornerRadius = 22
        imageview.layer.masksToBounds = true
        return imageview
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taylor Swift- Blank Space"
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.text = "Taylor Swift Blank Song in the US Region is Super Hit - 1,54,345,67 2years"
        textview.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textview.textColor = UIColor.lightGrayColor()
        return textview
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
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
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Top, relatedBy: .Equal, toItem: titleLabel, attribute: .Bottom, multiplier: 1, constant: 4))
        
        //left constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Left, relatedBy: .Equal, toItem: userProfileImageView, attribute: .Right, multiplier: 1, constant: 8))
        
        
        //right constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Right, relatedBy: .Equal, toItem: titleLabel, attribute: .Right, multiplier: 1, constant: 0))
        
        //height consttaint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 30))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

